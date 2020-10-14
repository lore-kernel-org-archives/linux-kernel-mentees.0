Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F167AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 13:04:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A70D20878
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 13:04:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fJ4C9Zaw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A70D20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9AE04878C4;
	Wed, 14 Oct 2020 13:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CceIBGzAHcDU; Wed, 14 Oct 2020 13:04:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DFB158789D;
	Wed, 14 Oct 2020 13:04:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8335C07FF;
	Wed, 14 Oct 2020 13:04:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F9C1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 854108789D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xegu2Cj75FlY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:04:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6C3E687870
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602680660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SEeiR89yjI9xFVeEVUoUu9rdjXMwFKArbd3q8yMhdnk=;
 b=fJ4C9Zawnvf1DyKMAbSMo6RD2s2x+Xaqq8yczMkjN13FmwfDYjPv/PvHTjWiWLO/5tNI4I
 8iCzq7bCpPh31niwR1AKoLqgFhIrPWwM2Pk39uoVIk7CXHM8CK71Ua+4x2ytvOp7L4bE/j
 LpqsNvQN2XfLuGtHV59eKsr2t0Q5GKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-djCRKjCEOcqbxFgj6vXNrg-1; Wed, 14 Oct 2020 09:04:18 -0400
X-MC-Unique: djCRKjCEOcqbxFgj6vXNrg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF9F09CC0C;
 Wed, 14 Oct 2020 13:04:16 +0000 (UTC)
Received: from [10.33.36.138] (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DC815D9D5;
 Wed, 14 Oct 2020 13:04:11 +0000 (UTC)
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
References: <20201013152648.438887-1-anant.thazhemadam@gmail.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <d75dc535-00be-3aa7-addb-c2615b202b56@redhat.com>
Date: Wed, 14 Oct 2020 14:04:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201013152648.438887-1-anant.thazhemadam@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: agruenba@redhat.com, Fox Chen <foxhlchen@gmail.com>,
 linux-kernel@vger.kernel.org,
 syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com,
 cluster-devel@redhat.com, rpeterso@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [Cluster-devel] [PATCH] fs: gfs2:
 prevent OOB access in gfs2_read_sb()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 13/10/2020 16:26, Anant Thazhemadam wrote:
> In gfs2_read_sb(), if the condition
> 	(d != sdp->sd_heightsize[x - 1] || m)
> isn't satisfied (in the first 11 iterations), the loop continues,
> and begins to perform out-of-bounds access.
> Fix this out-of-bounds access by introducing a condition in the for loop
> that ensures that no more than GFS2_MAX_META_HEIGHT + 1 elements are
> accessed.
> 
> In addition to this, if the above condition is satisfied when
> x = GFS2_MAX_META_HEIGHT (which = 10), and the flow of control breaks
> out of the loop, then an out-of-bounds access is performed again while
> assigning sdp->sd_heightsize[x] = ~0 (since x would be 11 now.), and
> also the assertion that spd->sd_max_height <= GFS2_MAX_META_HEIGHT would
> fail.
> Fix this out-of-bounds access and ensure that the assertion doesn't fail
> by introducing another variable "index", which keeps track of the last
> valid value of x (pre-increment) that can be used.

That's not quite the right approach. Your analysis below is correct: the 
problem stems from the block size in the superblock being zeroed by the 
fuzzer. So the correct fix would be to add a validation check for 
sb_bsize (gfs2_check_sb() is lacking somewhat). Valid values are powers 
of 2 between 512 and the page size.

Just a heads-up to avoid duplication of effort: Fox Chen (CCed) has 
attempted to fix this also[1], but I don't know if they plan to send 
another patch.

[1] https://www.redhat.com/archives/cluster-devel/2020-October/msg00006.html

Thanks,
Andy

> Reported-by: syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com
> Tested-by: syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
> 
> I have one question here (potentially a place where I suspect this
> patch could have a fatal flaw and might need some rework).
> 
> 	sdp->sd_max_height = x;
> 	sdp->sd_heightsize[x] = ~0;
> 
> Were these lines written with the logic that the value of x would be
> equal to (sdp->sd_heightsize[]'s last index filled in by the loop) + 1?
> Or, is the expected value of x at these lines equal to
> (sdp->sd_heightsize[]'s last index as filled in by the loop)?
> I would appreciate it if someone could clarify for me, how this would
> hold against the second potential out-of-bounds access I mentioned in my
> commit message.
> 
> An additional comment (which I feel is of some significance) on this.
> Reproducing the crash locally, I could infer that sdp->sd_fsb2bb_shift
> sdp->sd_sb.sb_bsize, sdp->sd_sb.sb_bsize_shift, and sdp->sd_inptrs
> were all 0.
> This by extension also means that in gfs2_read_sb(), all the attributes
> whose values were determined by performing some sort of calculation
> involving any one of these variables all resulted in either 0 or a
> negative value.
> Simply doing the math will also show how this was also the primary reason
> this OOB access occured in the first place.
> However, I still feel that gfs2_read_sb() could do with this bit of checking,
> since it fundamentally prevents OOB accesses from occuring in gfs2_read_sb()
> in all scenarios.
> Anyways, coming back to my initial point. Can having values like that be
> considered unacceptable and as something that needs to be handled (at
> gfs2_fill_super() maybe?) or is this non-anomalous behaviour and okay?
> 
>   fs/gfs2/ops_fstype.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 6d18d2c91add..66ee8fb06ab9 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -281,7 +281,7 @@ static int gfs2_read_sb(struct gfs2_sbd *sdp, int silent)
>   {
>   	u32 hash_blocks, ind_blocks, leaf_blocks;
>   	u32 tmp_blocks;
> -	unsigned int x;
> +	unsigned int x, index;
>   	int error;
>   
>   	error = gfs2_read_super(sdp, GFS2_SB_ADDR >> sdp->sd_fsb2bb_shift, silent);
> @@ -329,20 +329,21 @@ static int gfs2_read_sb(struct gfs2_sbd *sdp, int silent)
>   	sdp->sd_heightsize[0] = sdp->sd_sb.sb_bsize -
>   				sizeof(struct gfs2_dinode);
>   	sdp->sd_heightsize[1] = sdp->sd_sb.sb_bsize * sdp->sd_diptrs;
> -	for (x = 2;; x++) {
> +	for (x = 2; x <= GFS2_MAX_META_HEIGHT; x++) {
>   		u64 space, d;
>   		u32 m;
>   
> -		space = sdp->sd_heightsize[x - 1] * sdp->sd_inptrs;
> +		index = x;
> +		space = sdp->sd_heightsize[index - 1] * sdp->sd_inptrs;
>   		d = space;
>   		m = do_div(d, sdp->sd_inptrs);
>   
> -		if (d != sdp->sd_heightsize[x - 1] || m)
> +		if (d != sdp->sd_heightsize[index - 1] || m)
>   			break;
> -		sdp->sd_heightsize[x] = space;
> +		sdp->sd_heightsize[index] = space;
>   	}
> -	sdp->sd_max_height = x;
> -	sdp->sd_heightsize[x] = ~0;
> +	sdp->sd_max_height = index;
> +	sdp->sd_heightsize[index] = ~0;
>   	gfs2_assert(sdp, sdp->sd_max_height <= GFS2_MAX_META_HEIGHT);
>   
>   	sdp->sd_max_dents_per_leaf = (sdp->sd_sb.sb_bsize -
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
