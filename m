Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2836F3126AE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Dec 2025 01:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765763258; cv=none; b=rcv3HkMs8kMFEeVDc4SMSymEzn58WtWWQ0kvStJx6WJqC/AICS6+89rq9Z/hTdj5gD29bcgvkQMC9b1UOwILKILs4FWBGEa2x/QeurXwg9Uw4lb3IIz0B3uORmoO+EUNp1aiv7gpVxBYTbcWPl5n2tELeIMzzGtJ7JU2uoCCbXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765763258; c=relaxed/simple;
	bh=w5/l1o2Ccs+wTV82X39IQALsl81dNOiZ/a1Oj+eEziE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8Ri1TA37w7bFFMi5fioh5ji+QdopuXWcV9RUI4VdoUPVfSsdU69cy7VOBj1FY4m/NO+N0T0Qy+EPEsAhYZgEcnL3dQwP+FtgZwROLmv+i1Drr3nUxoI6tW+a2eHYz/F249ds9Iz61ryJy3Ib9X8TKuOgJX5ZdJGwd1c7iyNIcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k00bK3z8; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k00bK3z8"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 955824039B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Dec 2025 01:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRo3oJCQkBZ0 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Dec 2025 01:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=mathieu.poirier@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB96E4030E
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB96E4030E
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=k00bK3z8
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EB96E4030E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Dec 2025 01:47:35 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so3529939b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Dec 2025 17:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765763255; x=1766368055; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=60TiVQHwX+JgHVId/D5T9qrKNf/jEUK80ayznML9HB8=;
        b=k00bK3z8LG3Nh7B5Xa8RvlqV5La5nl9hbSl5NJokeLasniLRb3Aj3gHjLiVaXb4AMi
         SFeiCfpU5ATaRG0J8fuKq8HhZBcCtR4BPe7BJvjttOwgG+r1Hn+UaOwG16CGh01kQxqv
         jTjLMsXT8O7aVmJ2NK6kHHCrOPwiasvvn0xAI+we2aKuSxCuHALlRrgI5PluDqkHHVPt
         fg6pO02NRCxFLmYkDlhj5tLyLmmF2Fm5Q/rMNIVEePUPDUHlIUjyLFeKbQNtuGM3aE+N
         p1SJfF/wYYBcTiZXIdOyUzplgCnVmKTNbDO7rIPZKfO22tXz+lUSbXtwvXCoGbaRab9I
         YzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765763255; x=1766368055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60TiVQHwX+JgHVId/D5T9qrKNf/jEUK80ayznML9HB8=;
        b=Bf/C0v7rd4jR1SiKDS9QwSaQzRnraeAmnc2Stf3KhcBZxCBQf3T67oz3VW1ASZPOek
         IK1iElGCKcsTDd2dzuMIflyswYodGj9PpYGIQ+rMoZ+QC79/iKg1ZY8eJm9KPQL3yT1W
         7eTSALubgAmjZlieYRFRLBSVNV/dbZHYiEV4RBAwPPTMl0aFiFF91RaMm7NmDVYiJtu5
         KHZ0hcuxXRZ20RPcM/0xVpm7/OzSIQZcbo6qy4HODt8fjZiIlSJ8UHSQGo2XWJWBASxD
         XJ2rO2NBq4IcJaS0fcCU3meNbXBdnLJr3IQablyH8EHXHeNGc9COFMO9nJE/L57hqAGF
         wslg==
X-Gm-Message-State: AOJu0Yw6HVJmWaEO7wdoFmjBCfte6CWfhMyHtrqx38dy1oHq6LQ+X3Lh
	WKA/WABNNYyMXB5cOPHH67vePHL78dws7O0AGJmx4FSUiWBZ11AosuPHRurNhYQdcoE=
X-Gm-Gg: AY/fxX5mtJuQHQS4s3/FkUK8JGeFwWDch9wji9VH2G6f/1A14rKZfdP7GmG1qzNHsa0
	yEE5FOx9uHzHkDX9UnNn192563+9SeRLwjyDKv8QTNFEJ/nxbg8FdkUDeANj6A9sTGH3ivP4CiF
	wWNUUL+XMTb5UGbaHiTHfCxFScDK0HnMSpPt+NKjzCqRloiDlLzZRHTCxuqxnLUOwbe311ujCWl
	IHcnmeZHm7rzMSUk3R5iqrjuIEp1W6FIAjOwghYLjT9Qe9In3ruv1BZWO1Wp76rCWQwO8x/X14E
	o89tAFZHlIFU8EzEp9t0dqZaj48rKD+4d7NUJXRhBNCpYbJmoT1F01K4YdWO8qfEAskx8zLTEuq
	Y4x8Dq30+WB1binYkLfmK8oNeSLH8TJZBXLdS+V3ETc52bPgnRAn2four6dQTzbNR8xL2CUVcFg
	Ra5usja/rNh7GBuEH1XQZGgClGQGRa13BT+231nHb+vg==
X-Google-Smtp-Source: AGHT+IE7DB5VswrYSIey9vxa12pLuiwAgC9x+4syu1vaVA6PK12DnwXwjcCkNymmFng9LlbdJgerXA==
X-Received: by 2002:a05:6300:210c:b0:366:14ac:e1ea with SMTP id adf61e73a8af0-369b05bfa3dmr8389889637.80.1765763254691;
        Sun, 14 Dec 2025 17:47:34 -0800 (PST)
Received: from p14s (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2589d4f7sm10903627a12.3.2025.12.14.17.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 17:47:34 -0800 (PST)
Date: Sun, 14 Dec 2025 18:47:29 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Soham Metha <sohammetha01@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org,
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: remoteproc: Fix dead link to Keystone
 DSP GPIO binding
Message-ID: <aT9oseym8VmDGxzy@p14s>
References: <20251203180337.50831-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203180337.50831-1-sohammetha01@gmail.com>

On Wed, Dec 03, 2025 at 11:33:37PM +0530, Soham Metha wrote:
> The old text binding 'gpio-dsp-keystone.txt' was replaced by a DT schema in
> commit aff0a1701b020c8e6b172f28828fd4f3e6eed41a
> ("dt-bindings: gpio: Convert ti,keystone-dsp-gpio to DT schema").
> 
> Update the reference to point to the new file.
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
> ---
>  .../devicetree/bindings/remoteproc/ti,keystone-rproc.txt        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
> index 463a97c11eff..91f0a3b0c0b2 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
> @@ -66,7 +66,7 @@ The following are the mandatory properties:
>  - kick-gpios: 		Should specify the gpio device needed for the virtio IPC
>  			stack. This will be used to interrupt the remote processor.
>  			The gpio device to be used is as per the bindings in,
> -			Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
> +			Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml
>  
>  SoC-specific Required properties:
>  ---------------------------------
> -- 
> 2.34.1
> 
