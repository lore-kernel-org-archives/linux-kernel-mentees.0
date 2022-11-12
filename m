Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDB7C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Nov 2022 18:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5708E813C4;
	Sat, 12 Nov 2022 18:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5708E813C4
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=AQM6LM1f
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q3uFmoxFgggU; Sat, 12 Nov 2022 18:19:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1EF53813AB;
	Sat, 12 Nov 2022 18:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EF53813AB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0065C0033;
	Sat, 12 Nov 2022 18:19:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34092C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Nov 2022 18:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15E306063B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Nov 2022 18:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15E306063B
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=paragon-software.com
 header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail
 header.b=AQM6LM1f
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6mLNkVCXdCI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Nov 2022 18:19:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 233F26060A
Received: from relayaws-01.paragon-software.com
 (relayaws-01.paragon-software.com [35.157.23.187])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 233F26060A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Nov 2022 18:19:41 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com
 (vdlg-exch-02.paragon-software.com [172.30.1.105])
 by relayaws-01.paragon-software.com (Postfix) with ESMTPS id ED8BD1FE4;
 Sat, 12 Nov 2022 18:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paragon-software.com; s=mail; t=1668276409;
 bh=vIDSTmGfDYRWrkxZRsf26qzCp40g24+lWhiwN4Bq6vo=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=AQM6LM1f8Xx55H5wDnVculPAjZ1dgIJAzJKgjhE78B1vrFZX9ptjmSBHPS1oXL5UV
 mzSwmK/7BRWopf7h8Bhm0LRplOw6y+0URL/fSdqgQPStl22PGcagQ/J0NM9PB0nEF5
 OBJJhCxhF9I80OZrkC2QgiVQDkP2sUkxQtRQ6JJM=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Sat, 12 Nov 2022 21:09:40 +0300
Message-ID: <1ddcbb4a-ce49-a4a1-f8c2-a2896f3b2451@paragon-software.com>
Date: Sat, 12 Nov 2022 21:09:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] fs/ntfs3: Validate attribute data and valid sizes
Content-Language: en-US
To: Abdun Nihaal <abdun.nihaal@gmail.com>
References: <000000000000c2333105e9cc7b1c@google.com>
 <20221004031502.20007-1-abdun.nihaal@gmail.com>
In-Reply-To: <20221004031502.20007-1-abdun.nihaal@gmail.com>
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)
Cc: syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com,
 ntfs3@lists.linux.dev, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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
From: Konstantin Komarov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On 10/4/22 06:15, Abdun Nihaal wrote:
> The data_size and valid_size fields of non resident attributes should be
> less than the its alloc_size field, but this is not checked in
> ntfs_read_mft function.
> 
> Syzbot reports a allocation order warning due to a large unchecked value
> of data_size getting assigned to inode->i_size which is then passed to
> kcalloc.
> 
> Add sanity check for ensuring that the data_size and valid_size fields
> are not larger than alloc_size field.
> 
> Link: https://syzkaller.appspot.com/bug?extid=fa4648a5446460b7b963
> Reported-and-tested-by: syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com
> Fixes: (82cae269cfa95) fs/ntfs3: Add initialization of super block
> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> ---
>   fs/ntfs3/inode.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index e9cf00d14733..9c244029be75 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -132,6 +132,13 @@ static struct inode *ntfs_read_mft(struct inode *inode,
>   	if (le16_to_cpu(attr->name_off) + attr->name_len > asize)
>   		goto out;
>   
> +	if (attr->non_res) {
> +		t64 = le64_to_cpu(attr->nres.alloc_size);
> +		if (le64_to_cpu(attr->nres.data_size) > t64 ||
> +		    le64_to_cpu(attr->nres.valid_size) > t64)
> +			goto out;
> +	}
> +
>   	switch (attr->type) {
>   	case ATTR_STD:
>   		if (attr->non_res ||

Applied, thanks again for patch!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
