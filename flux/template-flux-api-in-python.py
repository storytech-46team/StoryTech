import json
from urllib import request

# API в формате JSON
prompt_text = """
{

  "5": {
    "inputs": {
      "width": 1024,
      "height": 768,
      "batch_size": 1
    },
    "class_type": "EmptyLatentImage",
    "_meta": {
      "title": "Empty Latent Image"
    }
  },
  "6": {
    "inputs": {
      "text": "",
      "clip": [
        "11",
        0
      ]
    },
    "class_type": "CLIPTextEncode",
    "_meta": {
      "title": "CLIP Text Encode (Prompt)"
    }
  },
  "8": {
    "inputs": {
      "samples": [
        "13",
        0
      ],
      "vae": [
        "10",
        0
      ]
    },
    "class_type": "VAEDecode",
    "_meta": {
      "title": "VAE Decode"
    }
  },
  "9": {
    "inputs": {
      "filename_prefix": "jupyter/jupyter",
      "images": [
        "8",
        0
      ]
    },
    "class_type": "SaveImage",
    "_meta": {
      "title": "Save Image"
    }
  },
  "10": {
    "inputs": {
      "vae_name": "ae.safetensors"
    },
    "class_type": "VAELoader",
    "_meta": {
      "title": "Load VAE"
    }
  },
  "11": {
    "inputs": {
      "clip_name1": "t5xxl_fp16.safetensors",
      "clip_name2": "clip_l.safetensors",
      "type": "flux",
      "device": "default"
    },
    "class_type": "DualCLIPLoader",
    "_meta": {
      "title": "DualCLIPLoader"
    }
  },
  "12": {
    "inputs": {
      "unet_name": "flux1-dev.safetensors",
      "weight_dtype": "default"
    },
    "class_type": "UNETLoader",
    "_meta": {
      "title": "Load Diffusion Model"
    }
  },
  "13": {
    "inputs": {
      "noise": [
        "25",
        0
      ],
      "guider": [
        "22",
        0
      ],
      "sampler": [
        "16",
        0
      ],
      "sigmas": [
        "17",
        0
      ],
      "latent_image": [
        "5",
        0
      ]
    },
    "class_type": "SamplerCustomAdvanced",
    "_meta": {
      "title": "SamplerCustomAdvanced"
    }
  },
  "16": {
    "inputs": {
      "sampler_name": "euler"
    },
    "class_type": "KSamplerSelect",
    "_meta": {
      "title": "KSamplerSelect"
    }
  },
  "17": {
    "inputs": {
      "scheduler": "simple",
      "steps": 20,
      "denoise": 1,
      "model": [
        "12",
        0
      ]
    },
    "class_type": "BasicScheduler",
    "_meta": {
      "title": "BasicScheduler"
    }
  },
  "22": {
    "inputs": {
      "model": [
        "12",
        0
      ],
      "conditioning": [
        "26",
        0
      ]
    },
    "class_type": "BasicGuider",
    "_meta": {
      "title": "BasicGuider"
    }
  },
  "25": {
    "inputs": {
      "noise_seed": 700913015534956
    },
    "class_type": "RandomNoise",
    "_meta": {
      "title": "RandomNoise"
    }
  },
  "26": {
    "inputs": {
      "guidance": 14.5,
      "conditioning": [
        "6",
        0
      ]
    },
    "class_type": "FluxGuidance",
    "_meta": {
      "title": "FluxGuidance"
    }
  }
}
"""

def queue_prompt(prompt):
    p = {"prompt": prompt}
    data = json.dumps(p).encode('utf-8')
    req = request.Request("http://comfyui:8188/prompt", data=data) #адрес и порт нашего ComfyUI
    request.urlopen(req)

# Загрузка промпта из JSON
prompt = json.loads(prompt_text)

# Установка текста для промпта
prompt["6"]["inputs"]["text"] = "Draw a (doodle-style) illustration. The background should be minimalistic. Description «Vlad»: «A 16-year-old young male with a shaved head and light skin tone, wearing a long-sleeved green and gray striped sweater, dark gray sweatpants, and white sneakers with green accents. The face is round, with full cheeks. Vlad has a full physique. Vlad's body looks plump, especially in the abdomen and shoulders. From the observer's point of view, there is a red spot or scar on the left side of the face that stretches from the temple to the cheekbone. The nose is of moderate size, straight». Description «Jay»: «A 16-year-old young male with short, messy white hair and blue eyes. Jay is wearing a black hoodie over a white t-shirt, paired with black cargo pants that have multiple pockets and a chain accessory. The character has a backpack with visible straps. The overall style is modern and casual, with a slightly serious expression on his face».  The position of the character «Vlad»: «Vlad is sitting at a school desk in the middle of the audience, slightly hunched over. (Vlad is facing the screen). Headphones are hanging from his neck, but he's not listening to music. His eyes scan the screen, trying to understand terms that seem too complicated to him». The position of the character «Jay»: «Jay sits in the next chair at Vlad's school desk, although he usually prefers to sit in the back rows. (Jay is facing the screen). Jay is dressed all in black, carefully holding his notebook for notes. White hair contrasts with a dark style of clothing». An auditorium at a school where a lecture on IT professions is being held. The room is filled with soft light from a projector, and a slide showing code is on the screen. Chairs are arranged in rows behind school desks, some students are enthusiastically taking notes, others are bored. Slides with vivid diagrams and examples of the use of technology in everyday life are changing on the screen. Keyboard sounds are coming from the teacher, who is typing additional materials."


# Установка сида для KSampler
prompt["25"]["inputs"]["noise_seed"] = 1154912

# Количество шагов
prompt["17"]["inputs"]["steps"] = 20

# Отправка запроса
queue_prompt(prompt)
