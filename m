Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9214DC83F11
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Aug 2023 03:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14D9F81E0F;
	Mon, 28 Aug 2023 03:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14D9F81E0F
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WX9rFIsM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LM9V6zO_8fLC; Mon, 28 Aug 2023 03:00:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1E51481B6D;
	Mon, 28 Aug 2023 03:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E51481B6D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0DBDC0039;
	Mon, 28 Aug 2023 03:00:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88E28C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 03:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5613381B7B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 03:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5613381B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v20I3vlcPkP9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 03:00:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED0B881B6D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 03:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED0B881B6D
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D60F060C63
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 03:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FF9C433C7
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 03:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693191626;
 bh=otjFS/8nOzqMsBwSJ/OzkjYo/maytY8GZwVsaXFlmug=;
 h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
 b=WX9rFIsMNS+yrTdGRuXMvADbB9RFUf1yjAQdLR7zTPLJEvcmaT5EErDfdas1WiFdT
 76i8sX+jykpTO542mqalzMpiANQm10VyLsC/iz9oIw2mADukDoDawsQWuzdPJbejHp
 qOglqbh7kV4ZWYg8Bm65OtSsdINsXwvG7muhZerelCe7Hf/qHMbeWK0p2rE0Vzf7EF
 d9G7jr+MULe2tcthn2OlS4PGjYM0/4+MPq5NBXPtNxVn0evao9YWNSITmDbwtkGKxr
 oV6G0RAKRUtQ66CpcjCHixM7vZ1cbZ3VfghQw4bRpdTLBg/BBye+nJsc5LUyetiKGO
 VXf048NQqXp5w==
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-5717f7b932aso1824563eaf.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 20:00:26 -0700 (PDT)
X-Gm-Message-State: AOJu0YyMwTWuI5/0Qy46rasCQeoJFx/jrWSU/YX44YT2g5Ydnu5bSAMW
 Dvtx9ZiRzjwV+7buwv7F8++CAL2VVRmoWP4Zgxg=
X-Google-Smtp-Source: AGHT+IHn+IZlq/F9TsDGUwaduR4k2lI9GSIkPRkjCukEQ4C/QzXTk6ZbBy3ti0e0YyvS2NHc2QQ+pkCPQO4kBE+KG40=
X-Received: by 2002:a4a:281a:0:b0:573:3711:51c4 with SMTP id
 h26-20020a4a281a000000b00573371151c4mr8363886ooa.8.1693191625380; Sun, 27 Aug
 2023 20:00:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6802:1090:b0:4f6:2c4a:5156 with HTTP; Sun, 27 Aug 2023
 20:00:24 -0700 (PDT)
In-Reply-To: <54a8ae10-71f4-9e91-d2b7-bd4a30a8ac2a@gmail.com>
References: <20230813055948.12513-1-ghandatmanas@gmail.com>
 <2023081621-mosaic-untwist-a786@gregkh>
 <54a8ae10-71f4-9e91-d2b7-bd4a30a8ac2a@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 28 Aug 2023 12:00:24 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9-NjSjt-TrJ6fYcPDHcaUm-L=-h5OU98DTw97J2qwmXA@mail.gmail.com>
Message-ID: <CAKYAXd9-NjSjt-TrJ6fYcPDHcaUm-L=-h5OU98DTw97J2qwmXA@mail.gmail.com>
Subject: Re: [PATCH v4] ntfs : fix shift-out-of-bounds in ntfs_iget
To: Manas Ghandat <ghandatmanas@gmail.com>
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Linux-kernel-mentees@lists.linuxfoundation.org,
 anton@tuxera.com
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

2023-08-18 15:34 GMT+09:00, Manas Ghandat <ghandatmanas@gmail.com>:
> Sorry for the last reply Greg. The last tag specifies the commit id.
> Also, I have sent the v5 of the patch in which I have made some critical
> changes. Please take a look at that.
Have you checked build error report from kernel test robot ?

>
> On 17/08/23 00:45, Greg KH wrote:
>> On Sun, Aug 13, 2023 at 11:29:49AM +0530, Manas Ghandat wrote:
>>> Currently there is not check for ni->itype.compressed.block_size when
>>> a->data.non_resident.compression_unit is present and NInoSparse(ni) is
>>> true. Added the required check to calculation of block size.
>>>
>>> Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
>>> Reported-by: syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?extid=4768a8f039aa677897d0
>>> Fix-commit-ID: upstream f40ddce88593482919761f74910f42f4b84c004b
>> What is this last tag for?  That's a kernel release version, what can be
>> done with that?
>>
>> confused,
>>
>> greg k-h
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
