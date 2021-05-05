Return-Path: <SRS0=XiGY=KA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6944C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 16:19:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7998360FD9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 16:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7998360FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D30A40346;
	Wed,  5 May 2021 16:19:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zAxCGqwE0bGy; Wed,  5 May 2021 16:19:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D8094033E;
	Wed,  5 May 2021 16:19:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5C37C000D;
	Wed,  5 May 2021 16:19:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92D85C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 16:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 729EB40346
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 16:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqh0X5J6mRyb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 16:19:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94A3D4033E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 16:19:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E4F46121F;
 Wed,  5 May 2021 16:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620231587;
 bh=fT7+zpvoWRmNytMZL2ErSfKueKL5e/EoY6lsi8pRg/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ACK3h/Z1y1ei7RhZZmJay3wwC2r70Mkq1UGqC9m+8ot1a05qF/bm3MPpdKXJeY3q5
 1FsDEnX0pFhV+lJYGdVNxGlfHrIm/9uu5hu0N4BWVohSfusDQdQQCch0FP/9kCrmoG
 8mPufec4nnVbS/NabyXAQ3nAI3MGYTaA5NiVxQjp+uiSk56q3E4KwkqW9CAN58egCV
 7S6hFJZMtBy4VS4/HfaKFW6SMj9sIj9yeBJs16kHMDxv9Ja4l9nPKLJsSuhdTmm4Hw
 qSmEkEYh18RYjL2Ww9hntexWe6QlOVLZBHOVuUufqvE9ay+NH9yOa9tTlP2mW0P31n
 eEekriI6jap5A==
Date: Wed, 5 May 2021 09:19:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH] ext4: fix kernel infoleak via ext4_extent_header
Message-ID: <YJLFoFDJr00SJRqa@gmail.com>
References: <20210505133011.32484-1-mail@anirudhrb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210505133011.32484-1-mail@anirudhrb.com>
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 syzbot+2dcfeaf8cb49b05e8f1a@syzkaller.appspotmail.com,
 linux-ext4@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Wed, May 05, 2021 at 07:00:10PM +0530, Anirudh Rayabharam wrote:
> Initialize eh_generation of struct ext4_extent_header to prevent leaking
> info to userspace. Fixes KMSAN kernel-infoleak bug reported by syzbot at:
> http://syzkaller.appspot.com/bug?id=78e9ad0e6952a3ca16e8234724b2fa92d041b9b8
> 
> Reported-by: syzbot+2dcfeaf8cb49b05e8f1a@syzkaller.appspotmail.com
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>

Can you include a "Fixes:" tag?

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
