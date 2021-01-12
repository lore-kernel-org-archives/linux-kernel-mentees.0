Return-Path: <SRS0=5uhS=GP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D09C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 06:41:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BAAF22CA1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 06:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BAAF22CA1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8B80D8683C;
	Tue, 12 Jan 2021 06:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4Q+avvVKkGa; Tue, 12 Jan 2021 06:41:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 85974867F2;
	Tue, 12 Jan 2021 06:41:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74D6FC0893;
	Tue, 12 Jan 2021 06:41:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8103AC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 06:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 63A5B204B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 06:41:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BG2QcJrSsjdR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 06:41:03 +0000 (UTC)
X-Greylist: delayed 00:20:02 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0208.hostedemail.com
 [216.40.44.208])
 by silver.osuosl.org (Postfix) with ESMTPS id 2A2B82002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 06:41:03 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 7AE0B18018055
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 06:02:42 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 056B7182CED34;
 Tue, 12 Jan 2021 06:02:40 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: snow87_3011fb027513
X-Filterd-Recvd-Size: 1865
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Tue, 12 Jan 2021 06:02:38 +0000 (UTC)
Message-ID: <81fda9fc9abde72cde4965d84effc358bee565cf.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>
Date: Mon, 11 Jan 2021 22:02:36 -0800
In-Reply-To: <CABJPP5DH1YfT2aQ5ejK4_VJZy-XJG8Jib+FJjHq3PD3XagP=+Q@mail.gmail.com>
References: <CAKXUXMzydtFqJ_ZRoF0HQugTBYHZZ56ws9AdUq6TmGL-m5JP3Q@mail.gmail.com>
 <CABJPP5DH1YfT2aQ5ejK4_VJZy-XJG8Jib+FJjHq3PD3XagP=+Q@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] comment on checkpatch
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, 2021-01-12 at 11:05 +0530, Dwaipayan Ray wrote:
> On Tue, Jan 12, 2021 at 10:38 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> =
wrote:
> > =

> > https://lore.kernel.org/linux-next/20210111230029.GM4728@sirena.org.uk/=
T/#m355576186555c4b6e85dbb9a1b3fe3d5e80f6e9f
> > =

> > Aditya, Dwaipayan, Have a look. checkpatch already handles this, right?
> > =

> Hi
> The following Fixes line in commit log emits no warning:
> =A0=A0=A0Fixes: Use packed mode for 32 bits per word transfers to increase
> =

> Neither does a fixes with mismatched commit description:
> =A0=A0=A0Fixes: e4da63cda51f ("networking: packet_mmap: fix old config re=
ference")
> =

> which should have been infact:
> =A0=A0=A0Fixes: e4da63cda51f ("docs: networking: packet_mmap: fix old con=
fig
> reference")
> =

> I could work on this if Lukas and Joe are okay with it.

It's not really a solvable problem as the SHA1 probably exists in an
individual local tree.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
