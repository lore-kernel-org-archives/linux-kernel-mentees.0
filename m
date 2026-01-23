Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49482D4B77
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Jan 2026 20:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769198792; cv=none; b=OQhfuezh+MrhEB4rxxlvlCNkZICuOFmEQM+zZLacKfV6xHGCV18y3RNdSD2QeVua4/knqFNXriEBsYBBZ4kyrt2DOLP+O4XpMd1lzLXtuM2gbyFw/p8v4ko3Cx6cxmAfOBQ/opVVciNWN/ya2aGXMn7xSxevA46SOUSCpm+IWlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769198792; c=relaxed/simple;
	bh=v1sXU4PdFUfhYag1oK10C//CQAN0sHDfsL1wvzXt6y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENrEVr5OGC7esTNxAwv8H06hPsRadRrPP5rSZ0Sx5/sEShO8EHWgL6BgSw1iZbPGqa0YL+3za3DCGSggvdOoJotRn+MdwRYL5mG9UHxDhs7rAtRmwQ3D9sT+mdJdCrjIfVEyJ0vurnmvDVTBMq7otDSOetig1RNpodv22p2sbg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRCM6Eb9; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRCM6Eb9"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A183C40AD2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Jan 2026 20:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OU1bnztq01er for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jan 2026 20:06:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED02C40ACC
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED02C40ACC
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YRCM6Eb9
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ED02C40ACC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Jan 2026 20:06:29 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-81c72659e6bso2655427b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Jan 2026 12:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769198789; x=1769803589; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mz/jgqDQ6Gq5gSxog3VT5ArFAGGJtxquZRf1ad8YXHk=;
        b=YRCM6Eb9pVNmLOFi3nr1UsQym2aimF1nX3Jdka6X+qGMuxdh58arGQj9lfAsKOQi02
         zzzZmC6B+qowYg1ZOFfR0e3kqfVD1OTj2D+F7QySX35Y/jqDmTANUDnaWDKKkWQHGgsk
         9o+taC6L7TjaP6+KzIZTo0Vf7UQwrTdgEmoteRvrYy1B1aE5h6a2stKgr4iWusTKT5KV
         dwtfTZqB3uVziO98PSSq67mVZlfDYAe058IHu7PNeHbbT34l3RKG4DlVD1ITBVl59Xfq
         220SVvKFZ7qNmGavRWhpK03aYf0b4+1QTWaRPcJC6UDUUAU12MohvObiVyqqUSLy1Zyu
         Efrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769198789; x=1769803589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mz/jgqDQ6Gq5gSxog3VT5ArFAGGJtxquZRf1ad8YXHk=;
        b=e2LgBOPo3XDso/okumDRKyAJSU3jgW4jWldbrcNzbpf21nR52jItuau0QojuehytD/
         E8a3pFeKinliEoXz21aOUpCjyQbfeHk25D4pNuFmrS6W5KFfBvl4qgUo/epWD9Afp0uX
         iynivcBXl+9Y289r2j0lMKDdSnEpSAp4YLRheQMqKhTQkv2wpJV6lbUVAua/cCky6VNi
         vmZUSBqQGcddAihTOh/7lqzigM3oXwTu/gcsJRLhZq/744gr0undXt1EuLsaQHw/5K2V
         m0Q9Dp1CJ2skF2gl5uHaPQhqbgWJcD0cAyneoK43kVbIr79MENlPcajAsMbem50CHJmO
         1YSQ==
X-Gm-Message-State: AOJu0YyI88aNLp69jvgelohK26MtooStHrrUA7dj91DwR0ugVW1STfRt
	TrPyn5TQkLG3xMbpYj1f0O6wdeRgLiU1zGhr+cUBOeA8T+zt0SCctFlOc3n+koH/
X-Gm-Gg: AZuq6aLl6GOMyY25MVLU0bPL6Zr/SwmiiRT79mpy16Gzpd+6t8Q2g+4H1+oWJPf4bgf
	Hsg8ianvOFTBJNGiN+99Cw5TDdMOOAf+VhcgiAlKtmkWW8vMoPYYU/8NQfqxUPbEWdB60PcNABY
	nLr3HuybcA5PFxAWf6v+Mjz4/N1QGRngcyyx+2P79Z0jfTVxUFmx1YcGDfUsPBx7JI871lV1eRP
	iFdkgmFsgqAjtbK5IBNbGnMTJWDI+vFqV5XykTwnxzXM3vj7VwAEvRn9O2DtJWz6j+4pOKbteq5
	vEUkl+J8OEIvdVRxWqH7MVZrgV89DTY7Lwm4UeL/4nJ6ifdLfdSkvyzf44jSPbxJuy/gieuiqDJ
	T2heRv+z6uY87uyHg0q0mHneAv2PFSR4ibA6X+spv/cxZN83HtRsdrJWj2bvciLwxcXm+NTqWST
	bDUEpMbWMC735mosekjpU=
X-Received: by 2002:a05:6a20:9c92:b0:38b:e944:3e94 with SMTP id adf61e73a8af0-38e6f7dad49mr3505436637.39.1769198788579;
        Fri, 23 Jan 2026 12:06:28 -0800 (PST)
Received: from [192.168.7.12] ([103.182.158.109])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a142e71sm2770571a12.11.2026.01.23.12.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 12:06:28 -0800 (PST)
Message-ID: <c79d4fbd-e9a4-4d73-a650-b01f437a4c0b@gmail.com>
Date: Sat, 24 Jan 2026 01:36:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rv: Fix dead link to monitor_synthesis.rst
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Gabriele Monaco <gmonaco@redhat.com>, linux-trace-kernel@vger.kernel.org
References: <20251203202259.69116-1-sohammetha01@gmail.com>
Content-Language: en-US
From: Soham Metha <sohammetha01@gmail.com>
In-Reply-To: <20251203202259.69116-1-sohammetha01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/12/25 01:52, Soham Metha wrote:
> The file 'da_monitor_synthesis.rst' was renamed to 'monitor_synthesis.rst' in
> commit f40a7c060207
> ("Documentation/rv: Prepare monitor synthesis document for LTL inclusion").
> 
> Update the reference to point to the new filename.
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
> ---
> No functional changes.
> 
>  include/rv/da_monitor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/rv/da_monitor.h b/include/rv/da_monitor.h
> index 17fa4f6e5ea6..c2cea209f230 100644
> --- a/include/rv/da_monitor.h
> +++ b/include/rv/da_monitor.h
> @@ -8,7 +8,7 @@
>   * The dot2k tool is available at tools/verification/dot2k/
>   *
>   * For further information, see:
> - *   Documentation/trace/rv/da_monitor_synthesis.rst
> + *   Documentation/trace/rv/monitor_synthesis.rst
>   */
>  
>  #include <rv/automata.h>

Hi,

Just a gentle ping on this documentation patch in case it was missed.
Please let me know if any changes are needed.

Thanks,
Soham
