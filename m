Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A254021B191
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 06:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761288594; cv=none; b=dAI5HlZI4ZwzOImLkugCsujk1v/Bre0jQYREw7JhIdwVwDq/hfLG8HYTec2Q4XUuZYcMtRN5q3OwLwO99UM7PURjWr3ubHxUwth8H9PHUqLSsgiUX/wQ1WA1H+0apQaPEtEHjU0pNL2EPbLAwlzjcWvAVbI+FU0cClAQaC/sHCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761288594; c=relaxed/simple;
	bh=9vBPEojZFqE9ty/6D3pThFauraHYwTpalTAAyZmWy+Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=VnDtbQ0uAoiH4FagFktdLKrcQ4yhfDRUkEwPrnZ4HmAIw8IQZAfBlKEOxter2HZipbGxrsOza/E0axdpNE5iLuagCTFlqFRLmYCeib1ug0Z+RxpEhujl5rporCLU0r6RXwEApdnI3eSum77Kzbric8RbO9+mWWP0nHsehBsHkmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNF5bgIt; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNF5bgIt"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C6254082C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 06:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kSEByyEdNZN for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Oct 2025 06:49:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=nirjhar.roy.lists@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96DC540825
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96DC540825
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CNF5bgIt
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 96DC540825
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 06:49:52 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7a226a0798cso1412831b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Oct 2025 23:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761288592; x=1761893392; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :cc:to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=km/6k02PixTAqdwRObjjj37gw0zTjmxCVFm4PbnN0vM=;
        b=CNF5bgItyoqvXOQDkqVU2EB0yRGAoYB48u157sAdw0zEoy4eXtOQYboKeU1ZFghW6N
         Ie5N7kXd/GGXzG2zk2MkXS4W9JHxfstjVekqhMy65Lp/476n/LAKaJ/SPR5RH+TzI9E9
         0K/IOpFobIcJ6c7zajVLD137sW87ltS1odkyARTJTrc2bIfegQzAm27HHdSLnV4nzRfU
         gHOeTDb1X30PM5CNgdzHeRRZ3fdPnjCrZx52wuwipbcKNqSz8yv0zIkyf0ylnuNTTQsj
         K8NIRwa21KV/epHKgAAfdOqDzfRPpFg/KXi28IE1iQlVPR2oaz0mdiPj00Na5UXjgpLi
         7LQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761288592; x=1761893392;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :cc:to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=km/6k02PixTAqdwRObjjj37gw0zTjmxCVFm4PbnN0vM=;
        b=M6MYdEyXWXyJBwMAMn7r7Bu3i21ba+tKfrQnF3cKpMKPUHvA5yRMMcSC03Gtt+H96D
         KiTH+/w8VhNACSD+32kh2wB8NKp++61/5nAqg1aPHnGfKzlotJ++tAvASEXIaEGpzlu/
         ozyWhvmA45KxMhB1qJpv/Bet/KB8/Lp/cChp1cE+E6zvrkL/D4Rv1bQaBParHnW7JklH
         YuXUzbdgyNik2+m5NkWYDJbBprSh/DC2hYT85/lwhoo8IFNCIWq/eyZyUm91A0X1G7k4
         sGJrlrOfhXU20oMQqmc6DX/bBZLpvr9bFBQNERnPRkG2xb3SgwSbndI4AmZtjeY1eYui
         +d/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXB1mt5zt88vmQ3gTsS+NIFHT7EkSLWsRFVRiaWhoUOkBMFYBXmFdrpLT19z4FgEColPymG0BqwlTQwjYnd8gI7d122jQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxUd3+K14vBcv6HTnNJUmc2BmY3SqxgjHbVZaBX8/fg8b3LRCiY
	OnLSGnKLLsqgE4hswdyhrJMtjIq5JbYSrffkGEJnwin16BUzQUf7Wled
X-Gm-Gg: ASbGncscHUFoCIwXEhyeudrssQmF+Bbjfph9+gmIfDgHRnOrg1Js/yWOTFGDOA1a1K6
	dXlGFnNiXDDBmabn8+sVtIEMFKGAk6Ev8gkdP5+PucOcu9zKspewlrpgw0PHppSE0SLKOECXvfS
	aVh7p2X2+cKxDJb30+SSLkuucfU0UsTX3k8ZVOEOSU/GS3u0dlxF+BCBs5jwW1WgJAFixvHx8ID
	Y02VVJXXOwHYQcxOuu5ZBVbYYHAspnVxdXxFlPc1K7gQ/+lU8InnqwzOPTG24xakIng02MFRtkT
	l+I2NBxEhVinGPn96btsypa0/fUI7oqI3IHVNVeaVBWwOHvY/X/CY/Ums1xQBa3Dvd1C4VodL+q
	J9A+GBYS0qunpbFL1aK6xW92whMRZNGoRU1dNBBs8M5jlcrHbhNfkDM1V87aLKZ+e4ZgJ/qTN9R
	3gwe3xVMJnUGo24bpKT+rq1DnuJ1vwnpHDlNs50vE6o4DjGT1HlRr0
X-Google-Smtp-Source: AGHT+IHBw2wC0BoP2X02OWCazdHGMebKdJsDNmkJBbtCK1oS/G49+mr3awzE1GU+XQHCYvJEsXB+uA==
X-Received: by 2002:a05:6a00:4fce:b0:7a2:7d3b:4356 with SMTP id d2e1a72fcca58-7a27d3b4449mr4993313b3a.32.1761288591770;
        Thu, 23 Oct 2025 23:49:51 -0700 (PDT)
Received: from li-5d80d4cc-2782-11b2-a85c-bed59fe4c9e5.ibm.com ([49.207.202.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb3789sm4779374b3a.60.2025.10.23.23.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 23:49:51 -0700 (PDT)
Message-ID: <47bc0211bd8cc5474fbb3edb5446e0e306ccb026.camel@gmail.com>
Subject: Re: [PATCH] xfs: use kmalloc_array() instead of kmalloc() for map
 allocation
From: "Nirjhar Roy (IBM)" <nirjhar.roy.lists@gmail.com>
To: Kriish Sharma <kriish.sharma2006@gmail.com>, Carlos Maiolino
	 <cem@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com
Date: Fri, 24 Oct 2025 12:19:46 +0530
In-Reply-To: <20251018194528.1871298-1-kriish.sharma2006@gmail.com>
References: <20251018194528.1871298-1-kriish.sharma2006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-27.el8_10) 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sat, 2025-10-18 at 19:45 +0000, Kriish Sharma wrote:
> Using kmalloc_array() better reflects the intent to allocate an array of
> map entries, and improves consistency with similar allocations across the
> kernel.
> 
> No functional change intended.
> 
> Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
> ---
>  fs/xfs/xfs_qm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/xfs/xfs_qm.c b/fs/xfs/xfs_qm.c
> index 23ba84ec919a..34ec61e455ff 100644
> --- a/fs/xfs/xfs_qm.c
> +++ b/fs/xfs/xfs_qm.c
> @@ -1218,7 +1218,7 @@ xfs_qm_reset_dqcounts_buf(
>  	if (qip->i_nblocks == 0)
>  		return 0;
>  
> -	map = kmalloc(XFS_DQITER_MAP_SIZE * sizeof(*map),
> +	map = kmalloc_array(XFS_DQITER_MAP_SIZE, sizeof(*map),
>  			GFP_KERNEL | __GFP_NOFAIL);
I think kmalloc_array is more useful when the size of memory to be allocated is dynamic with
kmalloc_array doing some additional checks on the size that is being passed. In this case, both
XFS_QUITER_MAP_SIZE  and sizeof(*map) are constant i.e, we are allocating constant size memory, so
maybe this isn't quite necessary?

Definition of kmalloc_array()

static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
{
	if (size != 0 && n > SIZE_MAX / size)
		return NULL;
	return kmalloc(n * size, flags);
}


--NR
>  
>  	lblkno = 0;

