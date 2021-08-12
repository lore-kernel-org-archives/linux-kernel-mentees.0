Return-Path: <SRS0=gjYE=ND=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F8DC4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 05:19:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEA6360FD7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 05:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEA6360FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72C10402AB;
	Thu, 12 Aug 2021 05:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uPHq7IrqwL9A; Thu, 12 Aug 2021 05:19:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0DC2E4002B;
	Thu, 12 Aug 2021 05:19:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4DC3C0010;
	Thu, 12 Aug 2021 05:19:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3B75C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 05:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C9DC40609
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 05:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1GvpVOreTEz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 05:19:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F1E440608
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 05:19:11 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id
 x13-20020a5eda0d0000b02905976d643e4cso2859524ioj.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 22:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=vAYClqij0nGxn6pQX2zV5X7oi626A4U9/u4hsAbCSsk=;
 b=hWIoX1PDOoo1NIVtrmdwb4uX5gkGddsGuSVu4Zv2kH6xnD2eCLpBBWfD51VZ/O9ePn
 jTc4dGyb1IEGQJnpDoyPnYgtO5bWj99fDl3kyRhCy/Xl4Geho/56xX98b0kWHNdfYneJ
 PFUGG6dvnzL0KLGPNT6Do/wNEZ1OTrQzXaZ4wKYqifNQNU1g37anYqQQRjuhRVvweE19
 BwQAGUl7qwU4+YY/Kugz35u0urQ/ztyoGpG8ZVaS2UGVUuFFNVb8sHNSsiK4HU6zVWMw
 bzo+S4n982rEIv6/k9moZhlwza7HBcITirpHKbB6qDZeM6muwJSaY/WuXTnfktBXM7rg
 EPAg==
X-Gm-Message-State: AOAM5312w/F5gC0Knl3qhwZraklGl2xBCDA8k7Q0V34x8/eTvurSywr/
 7jA28RXTEgWrEMAlKQwR20WEgRaW/Vlbcl/5ky0qbgDRQXpK
X-Google-Smtp-Source: ABdhPJwKnImalox7HdHKi7x9YHaW3z1Q/MyGYUO2gKpwVxsARpknotR0UEuiqgT7eCH1tXhs/b0QjX8Urm5c+ETchZAr4asAvYIr
MIME-Version: 1.0
X-Received: by 2002:a92:b308:: with SMTP id p8mr1541359ilh.296.1628745550454; 
 Wed, 11 Aug 2021 22:19:10 -0700 (PDT)
Date: Wed, 11 Aug 2021 22:19:10 -0700
In-Reply-To: <20210812045047.2548-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f6e6b305c955dff5@google.com>
Subject: Re: [syzbot] memory leak in packet_sendmsg
From: syzbot <syzbot+989efe781c74de1ddb54@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel-mentees@lists.linuxfoundation.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, phind.uet@gmail.com, 
 syzkaller-bugs@googlegroups.com
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

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file net/core/dev.c
patch: **** unexpected end of file in patch



Tested on:

commit:         761c6d7e Merge tag 'arc-5.14-rc6' of git://git.kernel...
git tree:       upstream
dashboard link: https://syzkaller.appspot.com/bug?extid=989efe781c74de1ddb54
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=147a5779300000

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
