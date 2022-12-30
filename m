Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BC5C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Dec 2022 07:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F47F40878;
	Fri, 30 Dec 2022 07:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F47F40878
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=a2wTt0UX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v7EVKIRvhvDb; Fri, 30 Dec 2022 07:22:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2C645404F9;
	Fri, 30 Dec 2022 07:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C645404F9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6C55C0033;
	Fri, 30 Dec 2022 07:22:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1FB6C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Dec 2022 07:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B92698193E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Dec 2022 07:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B92698193E
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=paragon-software.com
 header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail
 header.b=a2wTt0UX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5qF-ajAFTRCw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Dec 2022 07:22:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE75B817BD
Received: from relayaws-01.paragon-software.com
 (relayaws-01.paragon-software.com [35.157.23.187])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE75B817BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Dec 2022 07:22:12 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com
 (vdlg-exch-02.paragon-software.com [172.30.1.105])
 by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 9B971439;
 Fri, 30 Dec 2022 07:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paragon-software.com; s=mail; t=1672384716;
 bh=X8hh3t/cwLmbZlbKpsEr+gB7KcWiS5MNa7LWLYYwmek=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=a2wTt0UXa8yX8nv4T5ga/gkfckIA5deayPnQJir0DfLscJgYMDa6lzR4H9cwsAmD3
 OFNI0jKmZNbyhSTgXXOyRD/Pu9iuG1zsNMqUq0gZR4DC06mnUL54c5JGcQ7wY0UsQ+
 alJeJ9zCkjR3huhse0NQTjVMdU43KZ9zC503SVR4=
Received: from [192.168.211.146] (192.168.211.146) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 30 Dec 2022 10:22:08 +0300
Message-ID: <10b42aa8-4eda-c761-be12-9fe54e9f15d8@paragon-software.com>
Date: Fri, 30 Dec 2022 11:22:07 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] fs/ntfs3: Fix NULL dereference in ni_write_inode
Content-Language: en-US
To: Abdun Nihaal <abdun.nihaal@gmail.com>
References: <20221030070251.614970-1-abdun.nihaal@gmail.com>
In-Reply-To: <20221030070251.614970-1-abdun.nihaal@gmail.com>
X-Originating-IP: [192.168.211.146]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)
Cc: syzbot+f45957555ed4a808cc7a@syzkaller.appspotmail.com,
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

On 30.10.2022 11:02, Abdun Nihaal wrote:
> Syzbot reports a NULL dereference in ni_write_inode.
> When creating a new inode, if allocation fails in mi_init function
> (called in mi_format_new function), mi->mrec is set to NULL.
> In the error path of this inode creation, mi->mrec is later
> dereferenced in ni_write_inode.
>
> Add a NULL check to prevent NULL dereference.
>
> Link: https://syzkaller.appspot.com/bug?extid=f45957555ed4a808cc7a
> Reported-and-tested-by: syzbot+f45957555ed4a808cc7a@syzkaller.appspotmail.com
> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> ---
>   fs/ntfs3/frecord.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 70a80f9412f7..e55bbd209ef8 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -3243,6 +3243,9 @@ int ni_write_inode(struct inode *inode, int sync, const char *hint)
>   		return 0;
>   	}
>   
> +	if (!ni->mi.mrec)
> +		goto out;
> +
>   	if (is_rec_inuse(ni->mi.mrec) &&
>   	    !(sbi->flags & NTFS_FLAGS_LOG_REPLAYING) && inode->i_nlink) {
>   		bool modified = false;
Thank you for your work, applied!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
