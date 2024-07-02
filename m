Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7181384D39
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Jul 2024 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719909527; cv=none; b=V4tksbFmly3/ez+KcdAePJB0ZrbT4DrhyrhgNHmrvYh8M5SyIegDcKg9ncB8segqjS8ctDCqHCz8aV/AAHh4zKgN1eR+8eKgFz9qtyiyfw3aI1DrhQMoaGUBcQhFcyxzVoQ2IhENwRKZk2sQqvcj29N836lOYr5Av+l5z/5QPes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719909527; c=relaxed/simple;
	bh=Bk0aDhp5iOwermG+lJG9SHuvKM3ItOI1gjfJfDpNSCw=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YbSAMKGWI1N1NT9ude0THwJvaH8Evr4iIABGOsLQJOBkNRMqMfldAlZSiWrtThYVCEBWXFcy8sMqXUgioYh0XOAVjbLtZ+lwzUGSgY/gMcXXOSzq2ZUczyE4mZfEJUcZ7xINjt9Osxc1ygimxlNvQo5vsSSQSTcjOsmgFNGnGQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 162D840133
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Jul 2024 08:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.199
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UopNH3bMim5c for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Jul 2024 08:38:43 +0000 (UTC)
X-Greylist: delayed 984 seconds by postgrey-1.37 at util1.osuosl.org; Tue, 02 Jul 2024 08:38:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F9FE400C6
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F9FE400C6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yi.zhang@huawei.com; receiver=<UNKNOWN> 
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1F9FE400C6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Jul 2024 08:38:40 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WCwks2S5BzZhFj;
	Tue,  2 Jul 2024 16:17:41 +0800 (CST)
Received: from kwepemf100017.china.huawei.com (unknown [7.202.181.16])
	by mail.maildlp.com (Postfix) with ESMTPS id 58D781400C9;
	Tue,  2 Jul 2024 16:22:13 +0800 (CST)
Received: from [10.174.179.80] (10.174.179.80) by
 kwepemf100017.china.huawei.com (7.202.181.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 2 Jul 2024 16:22:12 +0800
Subject: Re: [PATCH] Fix WARNING in __ext4_ioctl
To: Pei Li <peili.dev@gmail.com>
CC: <linux-ext4@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<skhan@linuxfoundation.org>, <syzkaller-bugs@googlegroups.com>,
	<linux-kernel-mentees@lists.linuxfoundation.org>,
	<syzbot+2cab87506a0e7885f4b9@syzkaller.appspotmail.com>, Theodore Ts'o
	<tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>
References: <20240628-bug8-v1-1-417ef53cca33@gmail.com>
From: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <0c5957b2-3319-4c10-a3da-1c656809d9de@huawei.com>
Date: Tue, 2 Jul 2024 16:22:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240628-bug8-v1-1-417ef53cca33@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf100017.china.huawei.com (7.202.181.16)

On 2024/6/29 11:31, Pei Li wrote:
> Specify the size of s_volume_name in strscpy_pad() to avoid buffer
> overflow.
> 
> Reported-by: syzbot+2cab87506a0e7885f4b9@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=2cab87506a0e7885f4b9

Please add,
Fixes: 744a56389f73 ("ext4: replace deprecated strncpy with alternatives")

> Signed-off-by: Pei Li <peili.dev@gmail.com>
> ---
> strscpy_pad() by default takes the size of destination string as the
> size to be read from source string. However, as s_volume_name is only
> declared as an array of size EXT4_LABEL_MAX, we are reading 1 byte more
> than expected.
> 

I'd suggested to move this into the commit log to make it easier to
understand, and IIUC this issue only happens when s_volume_name is full
of 16 bytes length since it's not NULL terminated, so it can't break out
after copying 16 bytes.

Thanks,
Yi.

> Specify the size of s_volume_name in strscpy_pad() to avoid buffer
> overflow.> ---
>  fs/ext4/ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
> index dab7acd49709..0c4fb579757a 100644
> --- a/fs/ext4/ioctl.c
> +++ b/fs/ext4/ioctl.c
> @@ -1151,7 +1151,7 @@ static int ext4_ioctl_getlabel(struct ext4_sb_info *sbi, char __user *user_label
>  	BUILD_BUG_ON(EXT4_LABEL_MAX >= FSLABEL_MAX);
>  
>  	lock_buffer(sbi->s_sbh);
> -	strscpy_pad(label, sbi->s_es->s_volume_name);
> +	strscpy_pad(label, sbi->s_es->s_volume_name, EXT4_LABEL_MAX);
>  	unlock_buffer(sbi->s_sbh);
>  
>  	if (copy_to_user(user_label, label, sizeof(label)))
> 
> ---
> base-commit: 55027e689933ba2e64f3d245fb1ff185b3e7fc81
> change-id: 20240628-bug8-7f700a228c4a
> 
> Best regards,
> 
