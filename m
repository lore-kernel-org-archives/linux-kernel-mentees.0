Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98234C64E7A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 17:33:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A04C20575
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 17:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A04C20575
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E3FE28693F;
	Tue,  1 Dec 2020 17:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TXnVAkJaX3PD; Tue,  1 Dec 2020 17:33:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1799A8698F;
	Tue,  1 Dec 2020 17:33:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1090C0859;
	Tue,  1 Dec 2020 17:33:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0925FC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 17:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EA7F287EEE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 17:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ZQPv+ohIeaC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 17:33:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0004.hostedemail.com
 [216.40.44.4])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C943E87EC2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 17:33:06 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 8BB6F1802E8DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 17:24:49 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 07E5018224D8D;
 Tue,  1 Dec 2020 17:24:47 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: jump74_6009439273ac
X-Filterd-Recvd-Size: 1893
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Tue,  1 Dec 2020 17:24:46 +0000 (UTC)
Message-ID: <f4392362e682ce7a02eee8a2036e1035342a0b4f.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Date: Tue, 01 Dec 2020 09:24:44 -0800
In-Reply-To: <20201201112931.11192-1-yashsri421@gmail.com>
References: <20201201112931.11192-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add fix and
 improve warning msg for Non-standard signature
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

On Tue, 2020-12-01 at 16:59 +0530, Aditya Srivastava wrote:
> Currently, checkpatch.pl warns for BAD_SIGN_OFF on non-standard signature
> styles.
>
> This warning occurs because of incorrect use of signature tags,
> e.g. an evaluation on v4.13..v5.8 showed the use of following incorrect
> signature tags, which may seem correct, but are not standard:

I'm not a fan of this patch.

There is already a "non-standard" signature warning for
all of these cases since 2012, predating the range of this
retrospective evaluation by over 5 years and yet these
existing commits have been accepted.

The value in actual standardization and effectively
requiring specific signature style tags is quite low.

Anyone that signed a thing a particular way should be free
to sign the thing as they choose.

Most of these warnings would also still be in the tree in
the future in new patches as running checkpatch without
it emitting a message of any type isn't a requirement nor
should checkpatch use actually be required workflow.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
