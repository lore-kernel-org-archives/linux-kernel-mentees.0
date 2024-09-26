Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C7C15854D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 16:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727367129; cv=none; b=rTYx8gPMoSFv1dwctGgte6t770cFxvFge4qmxARJiIQ9ZwfpfzAoil//0iVOZzKG2d25pE/WYJAfS8hWbixoLtFYXf9hwLqgIqzJ5j2kZ+j/QWqRjfjLD62NDT4R5WfvAp6ehxKMjigommPmDHt1azZ4Sbai+rDDVbE4QAH2MGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727367129; c=relaxed/simple;
	bh=nkkwDyXoxEAKcaBvqfwuPFrD/PqXfR9ogYM2RBVmcOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAQNeelKJXbwV/dWvD0AwT3V2lnt+/j+tiSkgEZ33CRB9RHqn7JFFlJ/cZJnYEvzBdYOT9t4llcJcJi4uyLMMBIwbtY3dVnU+L0cGBMIodSMAAcxuoxZsY/IzU4/at3jBrtcjA+H2qvlgSBm8CcqOhcs6vwlEkgNiG0kfwl7veo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RqO5bvud; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RqO5bvud"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 931F241E49
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 16:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLlpWRRlshOl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Sep 2024 16:12:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D17841E56
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D17841E56
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=RqO5bvud
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5D17841E56
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 16:12:05 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3a098a478c4so3939455ab.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 09:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727367125; x=1727971925; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXe4I9fA3wiOsNFl3/de9Hw6T1XdMoOh/1M8Lx+MHF0=;
        b=RqO5bvudY/LBZb7PkQyS69SkFgj9WANELyed7A7cFkm7TB9kIXXGZa/Ao7hStN/o9q
         drZkqrn2Xatrubk7UlkW8lJDM9cYNnLG1O15IeeGXNTuoBSWqkQKyYHhIRoIWSrk89ra
         85chSB5nqhEkomphGuz0hHYJbiKzMuTsz1Ers=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727367125; x=1727971925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXe4I9fA3wiOsNFl3/de9Hw6T1XdMoOh/1M8Lx+MHF0=;
        b=jTSrUO7s+DyMz5Ffw70wnWkrVepoeP6pVQwGOQ/3jxnT1aCS3ZMIip/Hp85CiMljsE
         r9RryrdiugmTepRqdDU9R6jYaQvqhLJ1dktXaby5pERZffwr7Fff0zi3RoHa92U+wkN8
         ZXw28kpMRCUtM709UKZSsGhWU4ihYmIUhli0OZHREaQXm3s+bzVE/a3Hyfd6qIIlJbBz
         RPzYTCYjgWIBVoPe/QioeHbFdm55gpIKxWmbu7D2H2OasNQiLmPRiyOQBYlge17w9M7Z
         hPQGGFQ1I2WAYyQ11lOyXg9e+gFIiFAgdrTTxYdzPqUFFcvQYPSHo7iC84MKWOehd76n
         apbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHW9ip/Bewtkj5zTPjxwqNdzohU5edzT/6LjQE9lrH2comXbo7IvsgzZrenaP9+ezmVudT+CMrUF+JGGQc7kYK6EpG9A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyNuUYr0aKy7Lrt2IjC6+v3ypj2r1RYV1GP/amNdOkl4LyvCyHp
	FHJorN3EOKWXyLhhmMHG5l3HUNfJaelTfWwoKTnNECffQrWBJ3zU3cR3zWz/JyRYFw==
X-Google-Smtp-Source: AGHT+IEvE6107yExovZjcFsUxizIxC4rtlHj+wopr6Fb1m++dX51+cu1X/5Rl1UB0wF4yNFN/S/dGQ==
X-Received: by 2002:a05:6e02:1c47:b0:3a0:bc39:2d8c with SMTP id e9e14a558f8ab-3a26d7d0a87mr70629835ab.25.1727367125014;
        Thu, 26 Sep 2024 09:12:05 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a344df422dsm101335ab.81.2024.09.26.09.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 09:12:04 -0700 (PDT)
Message-ID: <ad6b7073-4fcf-41f9-b6ff-e01bf7089017@linuxfoundation.org>
Date: Thu, 26 Sep 2024 10:12:03 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Add a quirk for HP Pavilion 15z-ec200
To: Abhishek Tamboli <abhishektamboli9@gmail.com>, perex@perex.cz,
 tiwai@suse.com
Cc: kailang@realtek.com, sbinding@opensource.cirrus.com,
 simont@opensource.cirrus.com, josh@joshuagrisham.com, foss@athaariq.my.id,
 rf@opensource.cirrus.com, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240926155112.8079-1-abhishektamboli9@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240926155112.8079-1-abhishektamboli9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/24 09:51, Abhishek Tamboli wrote:
> Add the quirk for HP Pavilion Gaming laptop 15z-ec200 for
> enabling the mute led. The fix apply the ALC285_FIXUP_HP_MUTE_LED
> quirk for this model.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219303

Were you able to test  this on HP Pavilion Gaming laptop? If so
please add that to the change log.
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>   sound/pci/hda/patch_realtek.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 4ca66234e561..94125a977f08 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10315,6 +10315,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>   	SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
>   	SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
>   	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
> +	SND_PCI_QUIRK(0x103c, 0x88DD, "HP Pavilion 15z-ec200", ALC285_FIXUP_HP_MUTE_LED),
>   	SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>   	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
>   	SND_PCI_QUIRK(0x103c, 0x87d3, "HP Laptop 15-gw0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),

Looks like this has been fixed:

https://lore.kernel.org/lkml/20220918171300.24693-1-dhould3@gmail.com/t/#m0c6aeebe5cc89c9a4228d49f56f4a0a4c516e012

thanks,
-- Shuah
