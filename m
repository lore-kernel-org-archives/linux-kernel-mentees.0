Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EF3C7EE22
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 May 2023 07:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B77928470A;
	Thu, 11 May 2023 07:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B77928470A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QqtxcEea
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3fmuJjOmYOnH; Thu, 11 May 2023 07:55:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8BD00841E5;
	Thu, 11 May 2023 07:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BD00841E5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73B24C0036;
	Thu, 11 May 2023 07:55:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0256C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 May 2023 07:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 967E760BBF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 May 2023 07:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 967E760BBF
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=QqtxcEea
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tBD3BEY0ZFEs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 May 2023 07:55:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E80A60BBE
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E80A60BBE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 May 2023 07:55:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 087B0611DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 May 2023 07:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A44C4339C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 May 2023 07:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683791752;
 bh=Ee6CqD05l0SiT8ZITLwZUEkw+FY3HNQg9i3z6kZzgzU=;
 h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
 b=QqtxcEeayyeWyqXpOcNbOf4PObo5zx3qTzh8+FMMRcBnh3t+/j5i8Y/jH4pJ6qUG+
 aoqIzIFEuRrBhTqg/VWYZh1RfYwoNb1U8DkjMw/BvatJeOIa9Pba91z+PFkDI0KARr
 C+XH6DFmLoLJ5BG43jAiJInZH4yxM+9CGuJa+X7oCZGWGvhy6A/vBI9EdWFCSEkUPn
 wqJG6RQXxg4eq0iXQByOFrjbASw+/UCUmOGHlspRAgAZaHPiF06IWQzm/SSV92GoEa
 rHhn8fMDvXOmEcJsSU0TifcxbMXSErjqsFRY9pDxwVI+kqKGcZyG+sfEjsb3/BFV0y
 zpGJVUygB/o1A==
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-6ab0a942f46so2796200a34.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 May 2023 00:55:52 -0700 (PDT)
X-Gm-Message-State: AC+VfDy5m6jdp8VMhc9nCpy+mJAfRJg84stWRaa87j7skOeOBPjSH5Hp
 EibfqMZwMzbw1AcnQYy3hOw+EIh3/5MExdVXio4=
X-Google-Smtp-Source: ACHHUZ5QKdyusQlNfoFEyVt6NvreH/pSCh28lVRQWt6epudEY9lAaqfFuSFNQnOTc/oRcnX2Kz7QQhcoMgFZjLRqCSA=
X-Received: by 2002:aca:1c1a:0:b0:386:9720:77da with SMTP id
 c26-20020aca1c1a000000b00386972077damr3978338oic.26.1683791751414; Thu, 11
 May 2023 00:55:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:290:0:b0:4da:311c:525d with HTTP; Thu, 11 May 2023
 00:55:50 -0700 (PDT)
In-Reply-To: <20220829150309.GA26122@Negi>
References: <20220727001513.11902-1-soumya.negi97@gmail.com>
 <20220829150309.GA26122@Negi>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 11 May 2023 16:55:50 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-Aizt2Ffz33ZRWp42Q51-Bs09cwvgXOidmiABaKmcKHA@mail.gmail.com>
Message-ID: <CAKYAXd-Aizt2Ffz33ZRWp42Q51-Bs09cwvgXOidmiABaKmcKHA@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: Ensure $Extend is a directory
To: Soumya Negi <soumya.negi97@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Anton Altaparmakov <anton@tuxera.com>
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

2022-08-30 0:03 GMT+09:00, Soumya Negi <soumya.negi97@gmail.com>:
> On Tue, Jul 26, 2022 at 05:15:13PM -0700, Soumya Negi wrote:
>> Fix Syzbot bug: kernel BUG in ntfs_lookup_inode_by_name
>> https://syzkaller.appspot.com/bug?id=32cf53b48c1846ffc25a185a2e92e170d1a95d71
>>
>> Check whether $Extend is a directory or not( for NTFS3.0+) while
>> loading system files. If it isn't(as in the case of this bug where the
>> mft record for $Extend contains a regular file), load_system_files()
>> returns false.
>>
>> Reported-by: syzbot+30b7f850c6d98ea461d2@syzkaller.appspotmail.com
>> CC: stable@vger.kernel.org # 4.9+
>> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
>> ---
>> Changes since v1:
>> * Added CC tag for stable
>> * Formatted changelog to fit within 72 cols
>>
>> ---
>>  fs/ntfs/super.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
>> index 5ae8de09b271..18e2902531f9 100644
>> --- a/fs/ntfs/super.c
>> +++ b/fs/ntfs/super.c
>> @@ -2092,10 +2092,15 @@ static bool load_system_files(ntfs_volume *vol)
>>  	// TODO: Initialize security.
>>  	/* Get the extended system files' directory inode. */
>>  	vol->extend_ino = ntfs_iget(sb, FILE_Extend);
>> -	if (IS_ERR(vol->extend_ino) || is_bad_inode(vol->extend_ino)) {
>> +	if (IS_ERR(vol->extend_ino) || is_bad_inode(vol->extend_ino) ||
>> +	    !S_ISDIR(vol->extend_ino->i_mode)) {
>> +		static const char *es1 = "$Extend is not a directory";
>> +		static const char *es2 = "Failed to load $Extend";
>> +		const char *es = !S_ISDIR(vol->extend_ino->i_mode) ? es1 : es2;
>> +
>>  		if (!IS_ERR(vol->extend_ino))
>>  			iput(vol->extend_ino);
>> -		ntfs_error(sb, "Failed to load $Extend.");
>> +		ntfs_error(sb, "%s.", es);
>>  		goto iput_sec_err_out;
>>  	}
>>  #ifdef NTFS_RW
>> --
>> 2.17.1
>
> Hi Anton,
> Have you had a chance to look at this patch?
Hi,

Could you elaborate more ? Isn't MFT_RECORD_IS_DIRECTORY flags set in
mft record of $Extend ?

> Thanks,
> Soumya
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
