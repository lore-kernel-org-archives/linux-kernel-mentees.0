Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5981AA7A2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 11:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729770189; cv=none; b=mhpH060uBtrhPmQTqIgf86d0t08vduZJg0s0bqx/hfkPHRKHPrtVSFCEvhTXn3NDlSQN7tWwEcTKyU2RUpuT7LkqdbOzPz6CuwajbFF+isvkSyrasxDSSF/f5aRgTNNJAzN5L2nJWMfEfflMfuK0XHUPlBY2WYlBOROezdTRKKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729770189; c=relaxed/simple;
	bh=uxxha5CoSlXs0lL1JktSCRQ2sdEvIF88JesL7nMzplg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csLjD2S7o3dIsjG5a2pP27ToUcOyPNbeFDyRasA1POrfKrrKFwZv2jrZn2IDSclfCnYFBr4sz4YzxORCsnyr9qmcnnPuXTi0vPBOPNnZuow6yNjjSF62XOpTf5WLVSKLLiA74nenozyzTLCL6qP6fMd/81iB2ac5Rfr2xwYlZek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TJrbcQ8D; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TJrbcQ8D"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9E356070D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 11:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.493
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTa_g0Fc8cZa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Oct 2024 11:43:05 +0000 (UTC)
X-Greylist: delayed 586 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 24 Oct 2024 11:43:04 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6010F606E6
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linux.dev
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6010F606E6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TJrbcQ8D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.215.58.171; helo=out-171.mta1.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=<UNKNOWN> 
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6010F606E6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 11:43:04 +0000 (UTC)
Date: Thu, 24 Oct 2024 07:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729769594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NK3w/fF9wXIUILOnifbE5ISwxwg6DoLKLjlWnmFwHWc=;
	b=TJrbcQ8D505ClFdqAJ0276+gNflp29OWI7q7czuNH9xEQlw4KWr9I22FUj7Ex5Y1bA1Jo4
	18xAgql8BEJcZ5uR3zBl54UG9mLSQnjdk5U9LGpIDFDwpom7O81WV9JSsY5ujgLAgL/n8r
	Z9JUocg1enX00pcUv0Zg1OG6PJkx8iw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: manas18244@iiitd.ac.in
Cc: Hongbo Li <lihongbo22@huawei.com>, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Anup Sharma <anupnewsmail@gmail.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel-mentees@lists.linuxfoundation.org, 
	syzbot+e8eff054face85d7ea41@syzkaller.appspotmail.com
Subject: Re: [PATCH] bcachefs: Add missing btree_bitmap_shift check in
 bch2_dev_btree_bitmap_marked_sectors
Message-ID: <k5znyayne747jcqd4ljxakpwky35az65ahareqhlppj73dvg2t@qypyy6ibaxdg>
References: <20241022-fix-missing-cond-bcachefs-v1-1-064a40e55610@iiitd.ac.in>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-fix-missing-cond-bcachefs-v1-1-064a40e55610@iiitd.ac.in>
X-Migadu-Flow: FLOW_OUT

On Tue, Oct 22, 2024 at 08:55:32PM +0530, Manas via B4 Relay wrote:
> From: Manas <manas18244@iiitd.ac.in>
> 
> The syzkaller bug triggers BUG_ON assertions in
> __bch2_dev_btree_bitmap_mark. btree_bitmap_shift is checked in
> bch2_dev_btree_bitmap_marked_sectors prior to this. But only one out of
> two assertions is checked. This patch adds the other as conditional.
> 
> Reported-by: syzbot+e8eff054face85d7ea41@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=e8eff054face85d7ea41
> Signed-off-by: Manas <manas18244@iiitd.ac.in>
> ---
> The syzkaller bug[1] triggers BUG_ON assertions in
> __bch2_dev_btree_bitmap_mark.

The validation in validate_member() just needs to be fixed (and why 57?
that should be a constant, not a magic number).

> 
> btree_bitmap_shift is checked in bch2_dev_btree_bitmap_marked_sectors
> prior to this. But only one out of two assertions is checked. This patch
> adds the other as conditional.
> 
> A previous discussion about adding conditional in
> bch2_dev_btree_bitmap_marked_sectors is here[2].
> 
> [1] https://syzkaller.appspot.com/bug?extid=e8eff054face85d7ea41
> [2] https://lore.kernel.org/all/9ec25394-3d89-41b3-b62e-2d522cdc7319@huawei.com/
> ---
>  fs/bcachefs/sb-members.h | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/bcachefs/sb-members.h b/fs/bcachefs/sb-members.h
> index 762083b564ee5909071eb4235c3d5cd6e72ee519..3141791491928930a707a6a16579c6d2e11e3700 100644
> --- a/fs/bcachefs/sb-members.h
> +++ b/fs/bcachefs/sb-members.h
> @@ -347,12 +347,16 @@ void bch2_dev_errors_reset(struct bch_dev *);
>  static inline bool bch2_dev_btree_bitmap_marked_sectors(struct bch_dev *ca, u64 start, unsigned sectors)
>  {
>  	u64 end = start + sectors;
> +	u8 bitmap_shift = ca->mi.btree_bitmap_shift;
>  
> -	if (end > 64ULL << ca->mi.btree_bitmap_shift)
> +	if (bitmap_shift > 57)
> +		return true;
> +
> +	if (end > 64ULL << bitmap_shift)
>  		return false;
>  
> -	for (unsigned bit = start >> ca->mi.btree_bitmap_shift;
> -	     (u64) bit << ca->mi.btree_bitmap_shift < end;
> +	for (unsigned bit = start >> bitmap_shift;
> +	     (u64) bit << bitmap_shift < end;
>  	     bit++)
>  		if (!(ca->mi.btree_allocated_bitmap & BIT_ULL(bit)))
>  			return false;
> 
> ---
> base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
> change-id: 20241022-fix-missing-cond-bcachefs-a889f51e8aa2
> 
> Best regards,
> -- 
> Manas <manas18244@iiitd.ac.in>
> 
> 
