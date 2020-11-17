Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310C1C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 07:15:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 788B4246AE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 07:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="LjPHG7tP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 788B4246AE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E810386365;
	Tue, 17 Nov 2020 07:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EehjO1xa0oKM; Tue, 17 Nov 2020 07:15:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EA58A85BBD;
	Tue, 17 Nov 2020 07:15:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E07CDC0800;
	Tue, 17 Nov 2020 07:15:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DA02C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 07:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 69C25870A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 07:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t3gw2PLzFvYh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 07:15:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EB2D58709E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 07:15:04 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id u19so22471552lfr.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 23:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FH422auOcvg3mx3CArmAdcd0t9z9Df+F8yyRUj+2eIY=;
 b=LjPHG7tPbriUPkFYX2ucm7esQRk4bzaJzq8p/iMXLZym5YEz6mXCbGemqs7xfjkx3c
 oP9YDIlix5vrVQwuNtFkYPLzl18sqd5om11eCbyWy+2P9tZxIPsZjDeP/+M7Lr7kimbM
 rj1XH2e29Dbb3brr3lzmQm8pOBrJSRb/HOnCWYr2eUxivCG64R0pqT7NxBlRmuo+G07o
 OVpaWKJMEIpJqkdt0qtnjD8pE6PBEpP2evUdyhnnsx/5STeB3X9a8ztHncGmlVJs8D9U
 Or+9vUHxvky4gp9fEOBM3u0PHhreXaVoIo0RmTkWaUuaRjE/uCzsvw3RCJteDCgK8QEI
 vJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FH422auOcvg3mx3CArmAdcd0t9z9Df+F8yyRUj+2eIY=;
 b=GJVuUwV4Ua2WKNZDx6IA+ouKWpsUwe+2WOUg21gP0HoiXGbx5kJg4fS3xL+0dflww/
 zlAcnHUJvkwOudRG9j7kpwudq+54wzUqmUJCZUwmc+4EurSkSGjjcvEqcp7U16V9ksjA
 ZMmPPS9JoaGTow0BdmCai2T0LZ4fSNL71t0EmvIxjv3JIlqd0kvLCkXmvw6A7tgo9bpF
 ipl+Edb1VVzYwkpwYdjwtG8GEdxXc/808LLTGH9lum/DiJ9BJlXzDHHhOePXpJhrQ/mM
 Gpw+1oNOwmPChn60r7akRePhkLKAGN/MpVwYJuA9mbqeCg2Rc+RaUpXrLbrFP0guJlMp
 Gu3A==
X-Gm-Message-State: AOAM532zGUTrIEN/L2f+T+B2Yn6OmvT0tY4CMVlB3J91kD9dpXttjhEz
 H4lUc563mrAwuFSjs/X/sJ1+1Qoyz8s+WKK/LAlkEQ==
X-Google-Smtp-Source: ABdhPJxYwp/Fqs9s88SSUHtZpXDlrFzgN1WnNKkqNJHrf/qNueRSpPWWRi0XOV6rdH7ZU8PA4o0H3tRDIBe9gHsswa0=
X-Received: by 2002:a05:6512:1049:: with SMTP id
 c9mr1280439lfb.165.1605597302924; 
 Mon, 16 Nov 2020 23:15:02 -0800 (PST)
MIME-Version: 1.0
References: <20201116054035.211498-1-98.arpi@gmail.com>
In-Reply-To: <20201116054035.211498-1-98.arpi@gmail.com>
Date: Tue, 17 Nov 2020 15:14:51 +0800
Message-ID: <CABVgOSkQywfdd2obkCPGFZcMTAZxZm1KJnEf-rVxQGwPCFDnLA@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: Marco Elver <elver@google.com>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, "Bird, Tim" <Tim.Bird@sony.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v9 1/2] kunit: Support for
	Parameterized Testing
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
From: David Gow via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: David Gow <davidgow@google.com>
Content-Type: multipart/mixed; boundary="===============1164299316183496876=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1164299316183496876==
Content-Type: multipart/alternative; boundary="000000000000e5199a05b44840a1"

--000000000000e5199a05b44840a1
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2020 at 1:41 PM Arpitha Raghunandan <98.arpi@gmail.com>
wrote:

> Implementation of support for parameterized testing in KUnit. This
> approach requires the creation of a test case using the
> KUNIT_CASE_PARAM() macro that accepts a generator function as input.
>
> This generator function should return the next parameter given the
> previous parameter in parameterized tests. It also provides a macro to
> generate common-case generators based on arrays. Generators may also
> optionally provide a human-readable description of parameters, which is
> displayed where available.
>
> Note, currently the result of each parameter run is displayed in
> diagnostic lines, and only the overall test case output summarizes
> TAP-compliant success or failure of all parameter runs. In future, when
> supported by kunit-tool, these can be turned into subsubtest outputs.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> Co-developed-by: Marco Elver <elver@google.com>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>

This looks good to me! I tested it in UML and x86-64 w/ KASAN, and both
worked fine.

Reviewed-by: David Gow <davidgow@google.com>
Tested-by: David Gow <davidgow@google.com>

Thanks for sticking with this!

-- David

--000000000000e5199a05b44840a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Nov 16, 2020 at 1:41 PM Arpitha R=
aghunandan &lt;<a href=3D"mailto:98.arpi@gmail.com">98.arpi@gmail.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Implementation of support for parameterized testing in=
 KUnit. This<br>
approach requires the creation of a test case using the<br>
KUNIT_CASE_PARAM() macro that accepts a generator function as input.<br>
<br>
This generator function should return the next parameter given the<br>
previous parameter in parameterized tests. It also provides a macro to<br>
generate common-case generators based on arrays. Generators may also<br>
optionally provide a human-readable description of parameters, which is<br>
displayed where available.<br>
<br>
Note, currently the result of each parameter run is displayed in<br>
diagnostic lines, and only the overall test case output summarizes<br>
TAP-compliant success or failure of all parameter runs. In future, when<br>
supported by kunit-tool, these can be turned into subsubtest outputs.<br>
<br>
Signed-off-by: Arpitha Raghunandan &lt;<a href=3D"mailto:98.arpi@gmail.com"=
 target=3D"_blank">98.arpi@gmail.com</a>&gt;<br>
Co-developed-by: Marco Elver &lt;<a href=3D"mailto:elver@google.com" target=
=3D"_blank">elver@google.com</a>&gt;<br>
Signed-off-by: Marco Elver &lt;<a href=3D"mailto:elver@google.com" target=
=3D"_blank">elver@google.com</a>&gt;<br>
---<br></blockquote><div><br></div><div>This looks good to me! I tested it =
in UML and x86-64 w/ KASAN, and both worked fine.</div><div><br></div><div>=
Reviewed-by: David Gow &lt;<a href=3D"mailto:davidgow@google.com">davidgow@=
google.com</a>&gt;</div><div>Tested-by: David Gow &lt;<a href=3D"mailto:dav=
idgow@google.com">davidgow@google.com</a>&gt;</div><div><br></div><div>Than=
ks for sticking with this!</div><div><br></div><div>-- David</div></div></d=
iv>

--000000000000e5199a05b44840a1--

--===============1164299316183496876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1164299316183496876==--
