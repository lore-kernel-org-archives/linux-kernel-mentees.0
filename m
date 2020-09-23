Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E83DC2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 10:04:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE8EC2145D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 10:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE8EC2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 796AB872F4;
	Wed, 23 Sep 2020 10:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qj93SBqOJ5fV; Wed, 23 Sep 2020 10:04:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E15EB8703E;
	Wed, 23 Sep 2020 10:04:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD37CC0889;
	Wed, 23 Sep 2020 10:04:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03F45C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E47A385EF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:04:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWXP5JK6ZlRa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:04:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A29D985BD3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:04:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3226B207;
 Wed, 23 Sep 2020 10:04:42 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 3BB141E12E3; Wed, 23 Sep 2020 12:04:05 +0200 (CEST)
Date: Wed, 23 Sep 2020 12:04:05 +0200
From: Jan Kara <jack@suse.cz>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200923100405.GD6719@quack2.suse.cz>
References: <0000000000004c1f4d05afcff2f4@google.com>
 <20200922154531.153922-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922154531.153922-1-yepeilin.cs@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: syzkaller-bugs@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Jan Kara <jack@suse.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] udf: Fix memory leak in
 udf_process_sequence()
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue 22-09-20 11:45:31, Peilin Ye wrote:
> udf_process_sequence() is leaking memory. Free `data.part_descs_loc`
> before returning.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7b78fd02fb19 ("udf: Fix handling of Partition Descriptors")
> Reported-and-tested-by: syzbot+128f4dd6e796c98b3760@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=c5ec4e6f5d818f3c4afd4d59342468eec08a38da
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

Thanks for the patch but I've just yesterday written exactly the same patch
and merged it to my tree...

								Honza

> ---
>  fs/udf/super.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/udf/super.c b/fs/udf/super.c
> index 1c42f544096d..b0d862ab3024 100644
> --- a/fs/udf/super.c
> +++ b/fs/udf/super.c
> @@ -1698,7 +1698,8 @@ static noinline int udf_process_sequence(
>  					"Pointers (max %u supported)\n",
>  					UDF_MAX_TD_NESTING);
>  				brelse(bh);
> -				return -EIO;
> +				ret = -EIO;
> +				goto out;
>  			}
>  
>  			vdp = (struct volDescPtr *)bh->b_data;
> @@ -1718,7 +1719,8 @@ static noinline int udf_process_sequence(
>  			curr = get_volume_descriptor_record(ident, bh, &data);
>  			if (IS_ERR(curr)) {
>  				brelse(bh);
> -				return PTR_ERR(curr);
> +				ret = PTR_ERR(curr);
> +				goto out;
>  			}
>  			/* Descriptor we don't care about? */
>  			if (!curr)
> @@ -1740,28 +1742,32 @@ static noinline int udf_process_sequence(
>  	 */
>  	if (!data.vds[VDS_POS_PRIMARY_VOL_DESC].block) {
>  		udf_err(sb, "Primary Volume Descriptor not found!\n");
> -		return -EAGAIN;
> +		ret = -EAGAIN;
> +		goto out;
>  	}
>  	ret = udf_load_pvoldesc(sb, data.vds[VDS_POS_PRIMARY_VOL_DESC].block);
>  	if (ret < 0)
> -		return ret;
> +		goto out;
>  
>  	if (data.vds[VDS_POS_LOGICAL_VOL_DESC].block) {
>  		ret = udf_load_logicalvol(sb,
>  				data.vds[VDS_POS_LOGICAL_VOL_DESC].block,
>  				fileset);
>  		if (ret < 0)
> -			return ret;
> +			goto out;
>  	}
>  
>  	/* Now handle prevailing Partition Descriptors */
>  	for (i = 0; i < data.num_part_descs; i++) {
>  		ret = udf_load_partdesc(sb, data.part_descs_loc[i].rec.block);
>  		if (ret < 0)
> -			return ret;
> +			goto out;
>  	}
>  
> -	return 0;
> +	ret = 0;
> +out:
> +	kfree(data.part_descs_loc);
> +	return ret;
>  }
>  
>  /*
> -- 
> 2.25.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
