Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0757A74C08
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747406253; cv=none; b=kKMP8w9sT/vUyRAKucvU1To3njFukeMzpcBc3LGJwcLllnj8+Jfwb+sqm0txvuGBpF7Gai7cqL6jROOE9lrs7YQarnZdINsdno93DR44q/ifFiEzwx6e6fHvv2K74VjcRWYStIgPmcaHqpH6V9WADe7nZ5qoFfu22jr96PRQAdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747406253; c=relaxed/simple;
	bh=WwD/N93JoWvoK7UwKqwSLDauyBcOUESITur/eQjy79M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kRioyi7926pRp/SUQHFWJnhPN7HWYAtp7dnvgaI6TWCvfwGjtVfetLjxOOwAYHpSq5HzAcK/UNv+iSs4bniKQwbDE+7bE9B1GsPSV3BVuLK+Xd5u1GYxw1NCJQOPHXO8jnH8cSoCO3HwR01GrE1X1mB3v1AcGWTBjlLxqKqs4pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id B98C143865;
	Fri, 16 May 2025 14:37:20 +0000 (UTC)
Message-ID: <57352cc0-420b-42e6-a493-2764794a5206@ghiti.fr>
Date: Fri, 16 May 2025 16:37:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Implement endianess swap macros for RISC-V
Content-Language: en-US
To: Ignacio Encinas <ignacio@iencinas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, Zhihang Shao <zhihang.shao.iscas@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 linux-arch@vger.kernel.org
References: <20250426-riscv-swab-v4-0-64201404a68c@iencinas.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250426-riscv-swab-v4-0-64201404a68c@iencinas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeftdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemsgeiugehmeegfhduleemiegrledumeejkehftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemsgeiugehmeegfhduleemiegrledumeejkehftddphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemsgeiugehmeegfhduleemiegrledumeejkehftdgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepihhgnhgrtghiohesihgvnhgtihhnrghsrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhto
 hepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugidruggvvh
X-GND-Sasl: alex@ghiti.fr

Hi Arnd,

Do you think we can merge that for 6.16? It is nice improvement for us.

Thanks,

Alex

On 26/04/2025 16:56, Ignacio Encinas wrote:
> Motivated by [1]. A couple of things to note:
>
> RISC-V needs a default implementation to fall back on. There is one
> available in include/uapi/linux/swab.h but that header can't be included
> from arch/riscv/include/asm/swab.h. Therefore, the first patch in this
> series moves the default implementation into asm-generic.
>
> Tested with crc_kunit as pointed out here [2]. I can't provide
> performance numbers as I don't have RISC-V hardware yet.
>
> [1] https://lore.kernel.org/all/20250302220426.GC2079@quark.localdomain/
> [2] https://lore.kernel.org/all/20250216225530.306980-1-ebiggers@kernel.org/
>
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
> ---
> Changes in v4:
>
> - Add missing include in the 1st patch, reported by
>    https://lore.kernel.org/all/202504042300.it9RcOSt-lkp@intel.com/
> - Rewrite the ARCH_SWAB macro as suggested by Arnd
> - Define __arch_swab64 for CONFIG_32BIT (Ben)
> - Link to v3: https://lore.kernel.org/r/20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com
>
> Arnd, I know you don't like Patch 1 but I tried your suggestions and
> couldn't make them work. Please let me know if I missed anything [3] [4]
>
> [3] https://lore.kernel.org/linux-riscv/f5464e26-faa0-48f1-8585-9ce52c8c9f5f@iencinas.com/
> [4] https://lore.kernel.org/linux-riscv/b3b59747-0484-4042-bdc4-c067688e3bfe@iencinas.com/
>
> Changes in v3:
>
> PATCH 2:
>    Use if(riscv_has_extension_likely) instead of asm goto (Eric). It
>    looks like both versions generate the same assembly. Perhaps we should
>    do the same change in other places such as arch/riscv/include/asm/bitops.h
> - Link to v2: https://lore.kernel.org/r/20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com
>
> Changes in v2:
> - Introduce first patch factoring out the default implementation into
>    asm-generic
> - Remove blank line to make checkpatch happy
> - Link to v1: https://lore.kernel.org/r/20250310-riscv-swab-v1-1-34652ef1ee96@iencinas.com
>
> ---
> Ignacio Encinas (2):
>        include/uapi/linux/swab.h: move default implementation for swab macros into asm-generic
>        riscv: introduce asm/swab.h
>
>   arch/riscv/include/asm/swab.h   | 62 +++++++++++++++++++++++++++++++++++++++++
>   include/uapi/asm-generic/swab.h | 33 ++++++++++++++++++++++
>   include/uapi/linux/swab.h       | 33 +---------------------
>   3 files changed, 96 insertions(+), 32 deletions(-)
> ---
> base-commit: a7f2e10ecd8f18b83951b0bab47ddaf48f93bf47
> change-id: 20250307-riscv-swab-b81b94a9ac1b
>
> Best regards,
