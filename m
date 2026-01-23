Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0227F2D46D6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Jan 2026 20:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769198715; cv=none; b=IlzvSlIE/56cfEbmxC7d8FcouKygJPNug/VmTlwMIGYNHkzrv0Wg7FdDgDe+xtBHCxYHVp4Cvmb8FUD0plL0XX93muLMUrxnVINHT7RmwtsqvgfgzwfsvfuRz9c+a8ZdBQsmqJsxmklpk4IeQMSrtoHqINLL+H3iJHam8yYNleI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769198715; c=relaxed/simple;
	bh=0FiZzv3eRgUTE4Pe/d9KxcJfmOHxCh+VY08HykyybpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1OloRc6CwYB+CUM/VOi+8Lt5rXsJzkZFSUnB75b+36betIoUygSzWJr5NfSf3HOPKWka//MX04RSVmiIS15CqXW4alWKpx5YogiQhhsZgnjYkwD5Rjocyp/w3glKMF5EuarooOSWiiPW+lridnqN/IAyUSx/FBiI90VAgFh17U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJ7EBmUP; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJ7EBmUP"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD426400D3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Jan 2026 20:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olp8yOaay_tY for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jan 2026 20:05:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33B2D4000B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33B2D4000B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lJ7EBmUP
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 33B2D4000B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Jan 2026 20:05:11 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a2ea96930cso17047685ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Jan 2026 12:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769198711; x=1769803511; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hIt6EEVJiM9z9X9gOZcQSzWn9uWNq168RPZOsi0gMBo=;
        b=lJ7EBmUPnnWCAJbUIA12WUw7mZQ4TvS/fZwfMWEfE37EVyTR7rEm8LiloCorWTnI/v
         X9EC8jQms5zYkac1kg9IcpX4iyw78dNe7zNtYUAmAIoGw+P4Hjep+zoZ5qGEEiJn46LB
         8HclN02c1wDCvu7xbhL2io5KuKXP52JXwYAF8B6ge6Z3ejGYMH5sD0OL/FQB2PELzus7
         5t6GhuNo+PZGwAko1n5X9etKj4kdDwtbi2vkYsej0YJdAXT1L1xMJjZBDg8f0ha51dQn
         LEsgpsmtmz5m/ecAqtC8l5rCfFjJ5XMJxkHjd0fL3KkfLRh5gpY1kPt0Jsog0E0JXoed
         SNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769198711; x=1769803511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIt6EEVJiM9z9X9gOZcQSzWn9uWNq168RPZOsi0gMBo=;
        b=PxvkPBGEJkXARUVjX2fP0QEWoGffd95XpX3rkzd31HIhxy8+PULkwzDQNBRKs8ISCG
         r9VgbOTua6b+H++mW6+6wWg8WVC/rUKdJB+PGaSKuflnGhcSZsWbfuiIzOET++C4GIJr
         wiRqv1z/RJWAOybNISKoi9C905nOonZll6NwEEuOJotpd+c1VwFPw5YdHhJ/MeWI/i9/
         BafF+hvFnptott8S8hiGqgVfITNpYqVTlBYFHhKXckirX8SBY65jDxP35whZeH3P3tSM
         gP1m6+L+rFOPyanDpGziWGyi5wDZu27HKNAaR3vBgJMm3/JtJaR3ZXy/BvdfQRmu76+1
         58pg==
X-Gm-Message-State: AOJu0YxyQwXaPhzsVoaTYh7XX9kpDmUK37jcJYZI/Y/YzZqOPzDwJF3k
	Es2tF0S/3xOqiPuCQ34VPx0sJVZbW+JP+s69ggC59K4D9WLWv/MZg+tmrQT62Mpp
X-Gm-Gg: AZuq6aKqbRs48+f7t0qcghBbD1iQv9EfpCLBcpvaYDZ8iC6/bvvAunxLVlYWqCaytxq
	DzqYXG+WpduoOEogCo669jG8UpZuDw+sCfkVI0RgL73ROOtD23J976fx7l0C/n1h0MQ/Zb6e1fO
	vTz2j6oD7MRzZIXP4nmlflBl2ACTRrxfZ3J9RT3+17qojwf8KgQpvmBQeOPf1PcZfKwXuawqwCx
	QmgMpKJMjjyAVoWgXWcrZLtX/7SrRJ6UhEvnCCq4b1qQ7J7rl4KLvPR21TFgKa+eqm+/UQqoGFx
	6IcZh2K9ELqusHSTewGv1R2geW5CbfhzhjQYWj9X7VC60Q8rAh3mAMNFc9gkX+nFSDPGTUuptuO
	Yp9ULgxqnLLvVNSFnnVTO0X8Wru0GFcjeWhOkMNzXQnvoRVTcWVJ1Z6Oweq+BP96FT4/k+kGbgJ
	YwTAtYbETi4gZU5hwM3TttUKyDRG1K1w==
X-Received: by 2002:a17:902:db09:b0:298:4718:909f with SMTP id d9443c01a7336-2a7fe757006mr32714695ad.51.1769198710484;
        Fri, 23 Jan 2026 12:05:10 -0800 (PST)
Received: from [192.168.7.12] ([103.182.158.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f98583sm27149525ad.54.2026.01.23.12.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 12:05:09 -0800 (PST)
Message-ID: <f659ce0d-951f-406f-bdb4-29f23a30d851@gmail.com>
Date: Sat, 24 Jan 2026 01:35:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/mpic: Fix dead link to fsl/mpic.txt
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Gleixner <tglx@linutronix.de>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>,
 Thorsten Blum <thorsten.blum@linux.dev>, linuxppc-dev@lists.ozlabs.org
References: <20251203191706.58901-1-sohammetha01@gmail.com>
Content-Language: en-US
From: Soham Metha <sohammetha01@gmail.com>
In-Reply-To: <20251203191706.58901-1-sohammetha01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/12/25 00:47, Soham Metha wrote:
> Update the reference to the old 'fsl/mpic.txt' binding, which was removed in
> commit 326d25198112 ("dt-bindings: powerpc: Drop duplicate fsl/mpic.txt").
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
> ---
> No functional changes.
> 
>  arch/powerpc/sysdev/mpic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
> index ad7310bba00b..b6c7b7dc1622 100644
> --- a/arch/powerpc/sysdev/mpic.c
> +++ b/arch/powerpc/sysdev/mpic.c
> @@ -1105,7 +1105,7 @@ static int mpic_host_xlate(struct irq_domain *h, struct device_node *ct,
>  		 * First two cells are as usual.  Third specifies
>  		 * an "interrupt type".  Fourth is type-specific data.
>  		 *
> -		 * See Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
> +		 * See Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
>  		 */
>  		switch (intspec[2]) {
>  		case 0:

Hi,

Just a gentle ping on this documentation patch in case it was missed.
Please let me know if any changes are needed.

Thanks,
Soham
