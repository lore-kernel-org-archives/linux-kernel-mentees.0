Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E44C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 06:15:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7560C2064E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 06:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="o9xA6zzn";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WhPubNBp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7560C2064E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2501487250;
	Wed, 16 Sep 2020 06:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZL9AHg87YJh7; Wed, 16 Sep 2020 06:15:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A899E8723B;
	Wed, 16 Sep 2020 06:15:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B3B8C0859;
	Wed, 16 Sep 2020 06:15:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA6A1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 977BE86DE4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RsFbMIC6wqAT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:15:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D282086DD7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:15:48 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 29E185C00F5;
 Wed, 16 Sep 2020 02:15:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 16 Sep 2020 02:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=1FeN9RUCQkpP8rFk9zMjFMsMbdJ
 infBwncvpOPiw/sk=; b=o9xA6zznMel1d8/0CDVc5OYSNmEgxGIpOxDctBhzIWE
 lBXGqJlO8b1ePb9CbhfqZvwesuhmz4963su9cBPKtqYSKvbWKkl2m74i8jF2sjaW
 iPVY8/wr8pe/xjWMTUWMqyhIcJKiXb3qHDd8YewU3hSG71RUewTQwZioXnj2Jqpv
 Y3b9QII/aE65gZCXIkvMKndzPxJmzx+E8tE/zgi6oRpawR40ZpSy7ZkEwhwjzXdH
 oH7ZG2U/LmtOpxcwnX6ZZ23pMQt/LCSa//s49sMfHkxj70m3fCyNmUflSRVrkcAS
 TnuLYa5wfd+6LMybUxyne9/ZoGoVIbKbstmlYH6ssjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1FeN9R
 UCQkpP8rFk9zMjFMsMbdJinfBwncvpOPiw/sk=; b=WhPubNBp9ZHvAuf7n+yp1o
 M7JxwmAf3ckif65SowVRFr2gAcrF1V3GTmBHllx4mgZi+9WOI1YZPK6L8q09IxnS
 Tuk4AQiR/IQnRb6Y9wrEqqi5M/UnFCxaHNzFTa9lBHfBjZNQ3S3QBJSRqsWpLQoc
 gJyXhndSUBkbTmg7oKdPguP5m7G7gy3wCEJS/weSvcWleaI/5tmzVSoNoqyHFww0
 esyQFoQFGCqYS3eYYAchKgi59Q6DFmMVlenBT212ZqOaFbJZbIhXhpbTubdjze8F
 i+GVWg2FTcCiIYXK6QB2rsTZjNmOqZ1m3WsNOokegaHZKtj66qtzW3dxRL4DU/Ng
 ==
X-ME-Sender: <xms:kq1hX9_aP4uzM24YQiClflVDRYIL03O5WuEawU6tz8lCW8beri0ijA>
 <xme:kq1hXxunXhhMRrDUq-G4I1jmlp5hg2ttllUdhLEGK5ZYC9ScpEDumE37a0IaowurI
 7SuK_pcrJugxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddugdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepjeehheetve
 eiffeutdfhleekkeefleevgfdufeehtdejgeejhfdvffeggfdugeefnecuffhomhgrihhn
 pehshiiikhgrlhhlvghrrdgrphhpshhpohhtrdgtohhmnecukfhppeekfedrkeeirdejge
 drieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 ghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:kq1hX7DAs9htEhW1qeGeIoGfJD1BuGigsdJI4ra4Dld1AR1gFKaQjw>
 <xmx:kq1hXxeXykqx3vScv-Sz2tcxcSjsiaSvdw1UtTwEP596EJs77dZrxg>
 <xmx:kq1hXyPDeFPyzTQeVFeU8ogFUoLFswWVd9NWCTMjRk6hyDdgYPOzFw>
 <xmx:k61hX_p3MP55177xEjvwzgNOrliREEKa18IIF4MLhPOCUjX9GzdlYg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5259E3064684;
 Wed, 16 Sep 2020 02:15:46 -0400 (EDT)
Date: Wed, 16 Sep 2020 08:16:22 +0200
From: Greg KH <greg@kroah.com>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <20200916061622.GA142621@kroah.com>
References: <20200916052657.18683-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916052657.18683-1-anant.thazhemadam@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
 syzbot+4191a44ad556eacc1a7a@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: fix KMSAN uninit-value bug
 by initializing nd in do_file_open_root
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

On Wed, Sep 16, 2020 at 10:56:56AM +0530, Anant Thazhemadam wrote:
> The KMSAN bug report for the bug indicates that there exists;
> Local variable ----nd@do_file_open_root created at:
>  do_file_open_root+0xa4/0xb40 fs/namei.c:3385
>  do_file_open_root+0xa4/0xb40 fs/namei.c:3385

What does this "error" mean?

> Initializing nd fixes this issue, and doesn't break anything else either
> 
> Fixes: https://syzkaller.appspot.com/bug?extid=4191a44ad556eacc1a7a
> Reported-by: syzbot+4191a44ad556eacc1a7a@syzkaller.appspotmail.com
> Tested-by: syzbot+4191a44ad556eacc1a7a@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
>  fs/namei.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/namei.c b/fs/namei.c
> index e99e2a9da0f7..b27382586209 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -3404,7 +3404,7 @@ struct file *do_filp_open(int dfd, struct filename *pathname,
>  struct file *do_file_open_root(struct dentry *dentry, struct vfsmount *mnt,
>  		const char *name, const struct open_flags *op)
>  {
> -	struct nameidata nd;
> +	struct nameidata nd = {};

What exactly does setting this structure to all 0 fix here that is
currently "broken"?

confused,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
