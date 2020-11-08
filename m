Return-Path: <SRS0=ep41=EO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D758C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 10:42:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FE67206ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 10:42:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJe+q6Nx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FE67206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E41C32044B;
	Sun,  8 Nov 2020 10:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pL3fqPO482Ra; Sun,  8 Nov 2020 10:42:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A96E42013C;
	Sun,  8 Nov 2020 10:42:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92C9EC0889;
	Sun,  8 Nov 2020 10:42:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 797C6C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 10:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7526387097
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 10:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iM19KPyGiF5z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 10:42:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7797B870D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 10:42:39 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id z2so5647848ilh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Nov 2020 02:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rllxXK0bMu1rwhgV0ukrR2KShTD72lbUr8EKz6VE9As=;
 b=OJe+q6NxJUF7VUS5wYPSC+46u1VqzCJzOyadLd3VZXaUwVWTbm7KYAIZ0r6lpTf1vP
 3bR0HqAFnxQ0xY5pnZ5QEBKdCsI0mnWCX4JfBN/0TCdDXCKGZkCPanzbmBaYZYFu6h99
 K5SU8q8iVnmrh69wD1Zn+y9ELPFKcb5iRzqIcfHDvubAqP5UbLbdSSPuJ9D58CSaNgX9
 bR0mlPhx+e1KBilOZ0Mrq2XCjuRUukGAZ0+TLgDPzajr+yraIcuh3WDCg07APPzth1SW
 ke2dFIiKr/ZfSHQH48v0ls4ob/kheMFC8ID2rUMiNCeuM/eb+cjtK35Zy0DaR1F/5obA
 kuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rllxXK0bMu1rwhgV0ukrR2KShTD72lbUr8EKz6VE9As=;
 b=t50ruyluN8u5Srg5rVNLgotFObiJ8f9VeVToP7mVYV1cTlLr22LtfbRNph0K0ndv2w
 CekwrQkmIeI9HijCZFh450bhzVip3W9Uvvs9odmTlhalx8PKK6q82X+5BLETxDwViJsX
 msVLvjLWvyQaJw/iHJZSZYyBRP6hSDGFKE7Tm8tmvhThGDIHvjMhsXuMFySOvl3Uvjwd
 D1JM0J46aAyAeIShNve7kpLU4M6SpJIGs5fADcpawvf8pxPRv5DoTReeBCWb+2atRSW0
 VWimaEAb2soj8d6yxNvzyxtD7Ss50CLQaB5NZBVWmoydtRl7QDmiKw5IFQAGLJXEqmqu
 jpbg==
X-Gm-Message-State: AOAM533u+PGUijhFCDGwZ6kIPHxsK1ABSk3tx1MjtMIIddwD2+hmGkaX
 zsIHdpXQQwKzvbpLz650ngIuPBVNEX+3BXU6Wtg=
X-Google-Smtp-Source: ABdhPJytzWCCFM+ZJUcIqMy6pMa/Lmu3Rw0yFp+AR3www7myIAk6ay2xz6GriC/ReKn7ftwojVBI1V2ElTlZQOn8m2g=
X-Received: by 2002:a92:35c7:: with SMTP id c68mr6846696ilf.251.1604832158754; 
 Sun, 08 Nov 2020 02:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20201103151858.25375-1-yashsri421@gmail.com>
 <CAKXUXMzx=UacWsoPyiD5AVtfBpVDCcJpAFMo8OpXrf+KNpBFww@mail.gmail.com>
 <6fca02c0-4c4d-c6bd-67b2-35304cf25499@gmail.com>
 <CAKXUXMygzqgiCm+1SCaA5daO5HkoUXyhXS=QEE2d8GKUO4nypg@mail.gmail.com>
 <b8aac750-e460-74ad-674c-a340a1e4f188@gmail.com>
 <alpine.DEB.2.21.2011080738040.4909@felia>
 <ce5206bd-0beb-a35b-829c-968a01c92e6d@gmail.com>
In-Reply-To: <ce5206bd-0beb-a35b-829c-968a01c92e6d@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 8 Nov 2020 11:42:26 +0100
Message-ID: <CAKXUXMzGDwAaVqTxoqctu8nkx3ddJWR0LXvERjThsMA=P4EGzA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix for
	BAD_SIGN_OFF
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
Content-Type: multipart/mixed; boundary="===============6385322317251321312=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6385322317251321312==
Content-Type: multipart/alternative; boundary="000000000000bf2b5405b3961a9e"

--000000000000bf2b5405b3961a9e
Content-Type: text/plain; charset="UTF-8"

On So., 8. Nov. 2020 at 10:19, Aditya <yashsri421@gmail.com> wrote:

> On 8/11/20 12:17 pm, Lukas Bulwahn wrote:
> >
> >
> > On Sun, 8 Nov 2020, Aditya wrote:
> >
> >> On 8/11/20 12:08 am, Lukas Bulwahn wrote:
> >>>
> >>> Can you share the six commits?
> >>>
> >>> Then we check if the fix is really the right fix of if something
> different
> >>> is wrong with these commits.
> >>>
> >>
> >>
> >> These are the commits where this warning for BAD_SIGN_OFF was getting
> >> triggered(over 4.13..5.8):
> >> 1) Commit 1d1f898df658 ("rcu: Do RCU GP kthread self-wakeup from
> >> softirq and interrupt")
> >> 2) Commit 6e88559470f5 ("Documentation: Add section about CPU
> >> vulnerabilities for Spectre")
> >> 3) Commit a35d16905efc ("rcu: Add basic support for kfree_rcu()
> batching")
> >> 4) Commit b7e4aadef28f ("locking/spinlocks: Document the semantics of
> >> spin_is_locked()")
> >> 5) Commit 621df431b0ac ("Documentation/memory-barriers.txt:
> >> Cross-reference "tools/memory-model/"")
> >> 6) Commit 1c27b644c0fd ("Automate memory-barriers.txt; provide
> >> Linux-kernel memory model")
> >>
> >
> > I checked all six cases and think the proposed fix is always okay.
> >
> > I guess there is still the warning that Co-developed-by: should
> > immediately be followed up the Signed-off-by:, right?
> >
> > A possible fix for that would be to check if the needed Signed-off-by:
> > follows somewhere and then just move that to the appropriate place in
> the
> > patch.
> >
>
> Should I add this in the current patch itself or create another patch
> for it?
>

Make that further fix feature a new patch.

Lukas

--000000000000bf2b5405b3961a9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"auto">On So.=
, 8. Nov. 2020 at 10:19, Aditya &lt;<a href=3D"mailto:yashsri421@gmail.com"=
>yashsri421@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">On 8/11/20 12:17 pm, Lukas Bulwahn wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Sun, 8 Nov 2020, Aditya wrote:<br>
&gt; <br>
&gt;&gt; On 8/11/20 12:08 am, Lukas Bulwahn wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Can you share the six commits?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Then we check if the fix is really the right fix of if somethi=
ng different<br>
&gt;&gt;&gt; is wrong with these commits.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; These are the commits where this warning for BAD_SIGN_OFF was gett=
ing<br>
&gt;&gt; triggered(over 4.13..5.8):<br>
&gt;&gt; 1) Commit 1d1f898df658 (&quot;rcu: Do RCU GP kthread self-wakeup f=
rom<br>
&gt;&gt; softirq and interrupt&quot;)<br>
&gt;&gt; 2) Commit 6e88559470f5 (&quot;Documentation: Add section about CPU=
<br>
&gt;&gt; vulnerabilities for Spectre&quot;)<br>
&gt;&gt; 3) Commit a35d16905efc (&quot;rcu: Add basic support for kfree_rcu=
() batching&quot;)<br>
&gt;&gt; 4) Commit b7e4aadef28f (&quot;locking/spinlocks: Document the sema=
ntics of<br>
&gt;&gt; spin_is_locked()&quot;)<br>
&gt;&gt; 5) Commit 621df431b0ac (&quot;Documentation/memory-barriers.txt:<b=
r>
&gt;&gt; Cross-reference &quot;tools/memory-model/&quot;&quot;)<br>
&gt;&gt; 6) Commit 1c27b644c0fd (&quot;Automate memory-barriers.txt; provid=
e<br>
&gt;&gt; Linux-kernel memory model&quot;)<br>
&gt;&gt;<br>
&gt; <br>
&gt; I checked all six cases and think the proposed fix is always okay.<br>
&gt; <br>
&gt; I guess there is still the warning that Co-developed-by: should <br>
&gt; immediately be followed up the Signed-off-by:, right?<br>
&gt; <br>
&gt; A possible fix for that would be to check if the needed Signed-off-by:=
 <br>
&gt; follows somewhere and then just move that to the appropriate place in =
the <br>
&gt; patch.<br>
&gt; <br>
<br>
Should I add this in the current patch itself or create another patch<br>
for it?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Make that furthe=
r fix feature a new patch.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Lukas</div></div></div>

--000000000000bf2b5405b3961a9e--

--===============6385322317251321312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6385322317251321312==--
