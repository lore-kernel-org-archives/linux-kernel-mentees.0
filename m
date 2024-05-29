Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA393B295
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 12:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985680; cv=none; b=jKXrx0/dCs0raReGEhiQ++vcGpDOdClE4Y1qRPc9gNcQfTnlWrnQphFFGVh2jXxKtIxGvoHq4klO+BoWeCMFhPG1EgCGqjdSgIstIFt3emetG1X2IlYGBqJ3D+taCT9RykjmUZ9d3sdSmnDQLEZ8xLlN/l70bvOwPUjBPTw6kOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985680; c=relaxed/simple;
	bh=A2PaivvbHJ6+z/fjXCVTj+U6wyPAAu3Zi6GtdqrEe/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YLNS3Gl+0AHMvrylm+bwyRrHQ5ow6JzHDlebj0EOKDmwDCDoaM5oMqbQMjosj7h3CwDj0vdLmus0CqUU3CvaCdfmUPPlVQbLatcwqVseXT1J+Vm1T2eqDdbQdl76nV6aVQaHu5NPszYYvPDhBEKaZoFACHQxmK93QOnoPArKIy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EdIU458F; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EdIU458F"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D11840569
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 12:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.089
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4YHFcII-RKW for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 May 2024 12:27:58 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=jgross@suse.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 60FB740129
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60FB740129
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EdIU458F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 60FB740129
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 12:27:57 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4210aa012e5so18459555e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 05:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716985676; x=1717590476; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0im46VMvTgzf4CgpxLpfyG0tO3nmPdi92aMWun6A3U=;
        b=EdIU458F0/SKsGu2UMuK8PFK2Ulh2JIzvWAHaEaKyG6OBiBoClh4mnTq393DAQ/RGs
         JuJ7tIXZFiXNqDXGdg4DBk49Q+9vX0/1er5U4JZdmjByNbITrRaxC02SGOfGkplWzTj8
         UXF8dr8B2J+r0UCEn0fAnWC101I0LX/cex5HsjDIMSrlfiz4+lMj+OH5OMXxdiYp2SUn
         p6JAVckvZldOuRi2jk0Dxv8kCP8i649k1EG4EiTnK3pG+u6y0n4L0/du3b3XBXm0RPf8
         0V0eF9n3t+rtUI/37WhwJPdRN8m/RYT6nt9NX2Zyd+u9va6OsjexsugfwGUsK+hdlxZp
         1z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716985676; x=1717590476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0im46VMvTgzf4CgpxLpfyG0tO3nmPdi92aMWun6A3U=;
        b=VeEq6Iwpq3+H5zS/lJwJKNJeLW9aIUykVJrHSr5P0mvvsZkkKKUdhH5UwJBQ1tZE2V
         HfRG5Taod9kHmUY1IInsgkY3PSgRAyRqknJii4h0Xk/+xfqM5LJFjFFofKwyMeGWV6Ws
         2qxBGleIc/ZBsvNQRUcgvhb6HA6uQGs14hMaoqNzdFxlQOfPMIbD8Ob8yoxR8sHU+Grj
         8RaDwfjdAa8BhdZo54iyO/ReknY/m6SRhrf8woF0X4jxTpSR65ZYtkRObLFl8z/245s1
         f+n1atCPPJkVJ4L95QNkQR3iEhnww/QM6x/Q46ZIKNUHBye9tAp9wp7FGVL/tBXGwNMX
         bqIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYLcQ5iDxTdVWu2dLiZudackEj2c8mbPOIGKFoHej16tGzhQTe7MJqGUi/rUC64EgZ3RIoOlvee6/ftldsB13qgghlZ6V9mW51mSddDnlaugS7RVoHs7kd+9mZpQul
X-Gm-Message-State: AOJu0YxROmxDiqIhlompmEmQLNm5DGq9De8YLZpSJXbF2YPS2Fqk6PDO
	6e0IF8rkefSfQCqTD8qj6Zn0IMKmxF03Fjlcd6LCwRD/OcUTjaWtNXk8ZfInIo8=
X-Google-Smtp-Source: AGHT+IGh33p4hKsb6CQ/ea4derqiTxXb5sBTzSj5MqjCQx3uSuJyvMs24xDjjXfWO5KMwaEt87X2sA==
X-Received: by 2002:a05:600c:5593:b0:420:2b2e:f6e7 with SMTP id 5b1f17b1804b1-42108a79034mr125180765e9.17.1716985675868;
        Wed, 29 May 2024 05:27:55 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2? (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de. [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100fad7fasm211038455e9.38.2024.05.29.05.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 05:27:55 -0700 (PDT)
Message-ID: <0c53415d-3394-455a-a6b5-99d3efb92318@suse.com>
Date: Wed, 29 May 2024 14:27:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/xenbus: handle potential dangling pointer issue in
 xen_pcibk_xenbus_probe
To: yskelg@gmail.com, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: skhan@linuxfoundation.org, sj@kernel.org,
 Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20240529122232.25360-1-yskelg@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240529122232.25360-1-yskelg@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.05.24 14:22, yskelg@gmail.com wrote:
> From: Yunseong Kim <yskelg@gmail.com>
> 
> If 'xen_pcibk_init_devices()' fails. This ensures that 'pdev->xdev' does
> not point to 'xdev' when 'pdev' is freed.
> 
> Signed-off-by: Yunseong Kim <yskelg@gmail.com>
> ---
>   drivers/xen/xen-pciback/xenbus.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
> index b11e401f1b1e..348d6803b8c0 100644
> --- a/drivers/xen/xen-pciback/xenbus.c
> +++ b/drivers/xen/xen-pciback/xenbus.c
> @@ -54,6 +54,7 @@ static struct xen_pcibk_device *alloc_pdev(struct xenbus_device *xdev)
>   	INIT_WORK(&pdev->op_work, xen_pcibk_do_op);
>   
>   	if (xen_pcibk_init_devices(pdev)) {
> +		pdev->xdev = NULL;
>   		kfree(pdev);
>   		pdev = NULL;
>   	}

NAK.

This doesn't make any sense, as pdev is freed.


Juergen
