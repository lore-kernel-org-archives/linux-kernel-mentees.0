Return-Path: <SRS0=22Qo=2V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BD1C2D0C2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 15:32:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E41F205ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 15:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E41F205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1AD7184DD4;
	Tue, 31 Dec 2019 15:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w-nlpeXBAmVf; Tue, 31 Dec 2019 15:32:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6885D84D8A;
	Tue, 31 Dec 2019 15:32:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E5DEC18DC;
	Tue, 31 Dec 2019 15:32:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A289C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 15:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1CB888426E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 15:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PMmQ9Nvjvzd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 15:32:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CDCC884103
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 15:32:15 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id B3758536;
 Tue, 31 Dec 2019 15:32:14 +0000 (UTC)
Date: Tue, 31 Dec 2019 08:32:13 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191231083213.0786bda1@lwn.net>
In-Reply-To: <47e2ea6e-a808-5012-6f9a-8800fbd3be00@gmail.com>
References: <cover.1577681164.git.dwlsalmeida@gmail.com>
 <92be5a49b967ce35a305fc5ccfb3efea3f61a19a.1577681164.git.dwlsalmeida@gmail.com>
 <20191230121807.3a1f5f38@lwn.net>
 <47e2ea6e-a808-5012-6f9a-8800fbd3be00@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: mchehab+samsung@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/8] Documentation:
	nfsroot.txt: convert to ReST
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

On Tue, 31 Dec 2019 01:08:11 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> wrote:

> Would you please rephrase this? My first language isn't English and I am 
> not sure I understood that.
> 
> > It's best in general to avoid refilling paragraphs so as to make it clear
> > what is being changed.  But we would also like to avoid creating such long
> > lines.  Perhaps an add-on patch refilling things would satisfy both
> > criteria here.  

Changing text in an existing paragraph can
result in line lengths that are inconsistent and ragged, leading to a less 
pleasant appearance
and the temptation to "refill" the paragraph so that the 
lines are all approximately equal in length.  The problem with yielding
to that temptation is that it messes up
the diff output so that you can no longer easily see the actual
text changes that were made.

Thus, when making such changes, it can be better to not refill the
paragraphs - as, indeed, you did not.  But if the result becomes too
difficult to read (as in, it creates lines that are waaaay to long), it
can be good to create a second patch that makes only the cosmetic changes
without any associated text changes.  I was suggesting doing that in this
case.

Does that help?

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
