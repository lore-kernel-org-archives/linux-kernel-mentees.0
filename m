Return-Path: <SRS0=n4Lq=Y6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3595C5DF62
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Nov 2019 12:26:03 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 871E9217D7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Nov 2019 12:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 871E9217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4FC6AB88;
	Wed,  6 Nov 2019 12:26:03 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 511DBB5F
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Nov 2019 12:26:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
	[209.85.166.199])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4C42D8A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Nov 2019 12:26:01 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id x17so21465326ill.7
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 06 Nov 2019 04:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
	:from:to;
	bh=TuDU4N7KBIuKg05wOeBVNp8aWXiMZEYdUf0Wu4Ikdgg=;
	b=MjY+NFKWYAkBPuU+a7zs76zWwaaqLaRa++urrdgljQHMuUnZWcrtSPDQiB+d1zRQR6
	xbtN3CrFGXrI4h/BWac+v9Graxow82QmJFSRhFuOMCCZxg7UeCV/T5Hq5hpIZyJp/PCQ
	0LvQxw9EF8vHei6lclrIq3GKmd8wvb8/EiDaJEonUr/rhcQhIXWKQUXFgmE4Fc6cQ0xE
	v42b18ZNzHU129Ie8k5o31c4+vUe0uI6InMM00p8Q+n7lWRqurf32SOohpU4ZjPpPC5v
	8mh/BfCeClDpUYefXTnnZUIiWmeWALW7NUMSsEeLvEaOiRqxKb61MrqWJzBAzCFECOcu
	gckQ==
X-Gm-Message-State: APjAAAXgzwYXg4rM+SvLTrEmCDXnPPEVbdj794sgNX0RUzzU4dFOhY/E
	UeEG1k/gN3u9ymF8TPj82Hr1G4iJHamuA0ugopE/XIBsndR0
X-Google-Smtp-Source: APXvYqyqNmFWaPRN4zNU+bC77MAPWIqH8BFH6dmLMx4fBBLupHK5Ar+vM701NhR+mDHy+ptQJbA58+bJgVH9AFZmD9yfP0LTsyLP
MIME-Version: 1.0
X-Received: by 2002:a5d:8156:: with SMTP id f22mr31826636ioo.234.1573043160641;
	Wed, 06 Nov 2019 04:26:00 -0800 (PST)
Date: Wed, 06 Nov 2019 04:26:00 -0800
In-Reply-To: <1573040577.3090.22.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ce75df0596aca681@google.com>
From: syzbot <syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com>
To: 2pi@mok.nu, alex.theissen@me.com, andreyknvl@google.com, 
	gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, oneukum@suse.com, 
	syzkaller-bugs@googlegroups.com, tranmanphong@gmail.com
Subject: Re: [Linux-kernel-mentees] KASAN: use-after-free Read in
	appledisplay_bl_get_brightness
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com

Tested on:

commit:         e0bd8d79 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=8847e5384a16f66a
dashboard link: https://syzkaller.appspot.com/bug?extid=495dab1f175edc9c2f13
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14d463b2e00000

Note: testing is done by a robot and is best-effort only.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
