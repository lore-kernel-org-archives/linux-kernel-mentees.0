Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEDD2745C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Jun 2025 05:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751260027; cv=none; b=mM1vlONSMommr9UWYwWaWHaVuC3u8zRXFgSUg5euC3y2eZ6Z1nDEAmgof9creGqb89ij271XoCukKX4HlDyFy3EnMdMOEzKklvjpL7ScNl0Lz+gywCg5tgPzyEQjYzX5eq/bTIfRRo835IgxECNYdj/c0Fb5wXNSpyCDMiSvTRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751260027; c=relaxed/simple;
	bh=DGXltRkbg9KemiMxryS/esYXrIBegi2H8y9DdYmdKxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TiCEPHIUHVVGaAcRDMQBSTlnro2N2dHUV1asjSZe+8WTJuOCdA6L9DGiGog70MCOuaaINH4T6ftaFkqjmPUlPTIZSmeEva2YnkEhQmBRyEPisLQpS5ci39VdbtkP95kyRKSsVXGtMcsOG1tqC1B4nMgwbE+OkfJz9fe19Wyupg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FrRVTqrQ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FrRVTqrQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FF7740B96
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Jun 2025 05:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8nanl_Da81w for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Jun 2025 05:07:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB1334089B
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB1334089B
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FrRVTqrQ
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DB1334089B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Jun 2025 05:07:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81EC05C5988;
	Mon, 30 Jun 2025 05:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CB2C4CEE3;
	Mon, 30 Jun 2025 05:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751260022;
	bh=DGXltRkbg9KemiMxryS/esYXrIBegi2H8y9DdYmdKxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FrRVTqrQDs14OZUErAk4/NbzR8SdbjA3VUZfVevYkwkPjWVUUPSWFobno2GsF/l/y
	 7U3hJQwRfoumdb9GYeCI9o1JK5NwEtshgjmBQsyXmbrSVpl3gvMahxniGrQxKhLHD6
	 BrCCSbuIKk3UfVryu+9KuPf0h6/prbfPxT3o+kEE=
Date: Mon, 30 Jun 2025 07:06:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht, Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/amd64: replace sprintf with sysfs_emit in show
 functions
Message-ID: <2025063001-marigold-renewed-6361@gregkh>
References: <20250629182448.265407-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629182448.265407-1-marcelomoreira1905@gmail.com>

On Sun, Jun 29, 2025 at 03:24:48PM -0300, Marcelo Moreira wrote:
> Update all device attribute 'show' callbacks in the EDAC AMD64 driver to
> utilize sysfs_emit(). This change adheres to the recommendation outlined
> in Documentation/filesystems/sysfs.rst.
> 
> This modification aligns with current sysfs subsystem guidelines.
> 
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> ---
>  drivers/edac/amd64_edac.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index b681c0663203..b6d211255ef0 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -552,7 +552,7 @@ static ssize_t reg##_show(struct device *dev,				\
>  	struct mem_ctl_info *mci = to_mci(dev);				\
>  	struct amd64_pvt *pvt = mci->pvt_info;				\
>  									\
> -	return sprintf(data, "0x%016llx\n", (u64)pvt->reg);		\
> +	return  sysfs_emit(data, "0x%016llx\n", (u64)pvt->reg);		\

Why the extra ' '?


>  }
>  
>  EDAC_DCT_ATTR_SHOW(dhar);
> @@ -571,7 +571,7 @@ static ssize_t dram_hole_show(struct device *dev, struct device_attribute *mattr
>  
>  	get_dram_hole_info(mci, &hole_base, &hole_offset, &hole_size);
>  
> -	return sprintf(data, "%llx %llx %llx\n", hole_base, hole_offset,
> +	return sysfs_emit(data, "%llx %llx %llx\n", hole_base, hole_offset,
>  						 hole_size);
>  }
>  
> @@ -602,7 +602,7 @@ static ssize_t inject_section_show(struct device *dev,
>  {
>  	struct mem_ctl_info *mci = to_mci(dev);
>  	struct amd64_pvt *pvt = mci->pvt_info;
> -	return sprintf(buf, "0x%x\n", pvt->injection.section);
> +	return sysfs_emit(buf, "0x%x\n", pvt->injection.section);
>  }
>  
>  /*
> @@ -638,7 +638,7 @@ static ssize_t inject_word_show(struct device *dev,
>  {
>  	struct mem_ctl_info *mci = to_mci(dev);
>  	struct amd64_pvt *pvt = mci->pvt_info;
> -	return sprintf(buf, "0x%x\n", pvt->injection.word);
> +	return sysfs_emit(buf, "0x%x\n", pvt->injection.word);
>  }
>  
>  /*
> @@ -675,7 +675,7 @@ static ssize_t inject_ecc_vector_show(struct device *dev,
>  {
>  	struct mem_ctl_info *mci = to_mci(dev);
>  	struct amd64_pvt *pvt = mci->pvt_info;
> -	return sprintf(buf, "0x%x\n", pvt->injection.bit_map);
> +	return sysfs_emit(buf, "0x%x\n", pvt->injection.bit_map);

There's nothing wrong with these sprintf() lines, so no need to change
them, right?

I only recommend making this type of change when adding new sysfs files,
no need for churn on old files when it is not needed at all.

thanks,

greg k-h
