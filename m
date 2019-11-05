Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB17C5DF60
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 21:35:59 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5902721882
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 21:35:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7HMdSoq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5902721882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 47AF1DC9;
	Tue,  5 Nov 2019 21:35:59 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AD804DAF
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:35:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D22FA8A0
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:35:55 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id l202so19002077oig.1
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 13:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R7vL+wf0RLxZtrhWn+/6roQNhTho4+j8C9ijb1jQEJs=;
	b=S7HMdSoqEswpEMFBlJyasf3YyvrH1hoN+m5q8oscyBq/YgfPHPJEuRKUWNsT/5ZW4N
	f4h8vMRObVU0WCYZxwo8sqz3SAHsDhHtqJpaOhC5Avzce0ognTcQcsgnNGBoV9idN9oJ
	Zmjvxi6Smr5ilvstwgsob6xoL9bcnWP3nC/LVC5X04cEFSbVOW3VoqgWi2CiWUShLeFz
	KQybft71b8ItWdMyIx9eIlHMKjlAYk7H1WurzgprFU22H2th7qpWQfdG9U02wAPCUrMm
	s6iJWoT0fTIBiv/UI8t1QBlh+qseSxjwt1jNDIUheHwKHZt+yBbDyBnDDe4n920QCQqH
	E6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R7vL+wf0RLxZtrhWn+/6roQNhTho4+j8C9ijb1jQEJs=;
	b=ZlVyOwm7hDKq0gso0Z+ZlWwvAMjRaa0piXiIa6Jdj1xYwZ5UrMnLTc7MirBRVG7ANV
	/qsoPqPQtUrYFx6vssaG3vIvZVTqE/hNxUxKcW3sS78Ciab5tyPS5Ik3IcyVN5ag1azk
	1FAFh1RUZqNA/8dZgAnwiQM5jtotlzHIWofR8/CbgIDDDLpkag9UgJlb+qQQTDEU821p
	XoZr3SjsIVOEVJ7sfyJVLBMPrhdoAXCP/pbuorY345mYjgPHDwHjsE5D1+wJIMBHa9EA
	4YRXuutfgPAynW8pJ4BPVy7sx2GiVGvwEglOb8XgLqDoCBsQA7cR7pG+V233lRToBsGe
	BR5A==
X-Gm-Message-State: APjAAAVIrK5Va5q3iXGrP2fn5FVazMetIaddPF0Fz/ngXvx+OkcV0snc
	OC7cLwqfKBSU86q+4U4Dl/sIl3WgfPUaHiKb+RI=
X-Google-Smtp-Source: APXvYqxRxiCd7dtuJ9ZG5nYbVw/6BJk83tS6mzlMopN9b7HsjfFWXNSxCbe4UkIraHIeZmYlVvInvrKg7CzDHlob3aE=
X-Received: by 2002:aca:c4c3:: with SMTP id u186mr919527oif.173.1572989754770; 
	Tue, 05 Nov 2019 13:35:54 -0800 (PST)
MIME-Version: 1.0
References: <20191028202417.13095-1-madhuparnabhowmik04@gmail.com>
	<ac8da2f5-4cda-8985-ff90-061478a4e2c9@gmail.com>
	<20191105140411.GO20975@paulmck-ThinkPad-P72>
	<20191105143344.GA9069@workstation>
	<20191105144515.GS20975@paulmck-ThinkPad-P72>
In-Reply-To: <20191105144515.GS20975@paulmck-ThinkPad-P72>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Wed, 6 Nov 2019 03:05:43 +0530
Message-ID: <CAF65HP1FGtQ8j357=zx2sQBiuFZCd=khPrC3CBkM8VBvm=jgKQ@mail.gmail.com>
To: paulmck@kernel.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: RCU: arrayRCU:
 Converted arrayRCU.txt to arrayRCU.rst
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
Content-Type: multipart/mixed; boundary="===============2137311031947016748=="
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

--===============2137311031947016748==
Content-Type: multipart/alternative; boundary="000000000000918ada0596a03729"

--000000000000918ada0596a03729
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Amol and Phong for your valuable feedback. I have made the
changes requested and sent the patch.

https://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/2019-Novem=
ber/001055.html

Regards,
Madhuparna
=E1=90=A7

On Tue, Nov 5, 2019 at 8:15 PM Paul E. McKenney <paulmck@kernel.org> wrote:

> On Tue, Nov 05, 2019 at 08:03:44PM +0530, Amol Grover wrote:
> > On Tue, Nov 05, 2019 at 06:04:11AM -0800, Paul E. McKenney wrote:
> > > On Tue, Nov 05, 2019 at 08:49:47PM +0700, Phong Tran wrote:
> > > > On 10/29/19 3:24 AM, madhuparnabhowmik04@gmail.com wrote:
> > > > > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > > > >
> > > > > This patch converts arrayRCU from txt to rst format.
> > > > > arrayRCU.rst is also added in the index.rst file.
> > > > >
> > > > > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > > > > ---
> > > > >   .../RCU/{arrayRCU.txt =3D> arrayRCU.rst}         | 18
> +++++++++++++-----
> > > > >   Documentation/RCU/index.rst                    |  1 +
> > > > >   2 files changed, 14 insertions(+), 5 deletions(-)
> > > > >   rename Documentation/RCU/{arrayRCU.txt =3D> arrayRCU.rst} (91%)
> > > > >
> > > > > diff --git a/Documentation/RCU/arrayRCU.txt
> b/Documentation/RCU/arrayRCU.rst
> > > > > similarity index 91%
> > > > > rename from Documentation/RCU/arrayRCU.txt
> > > > > rename to Documentation/RCU/arrayRCU.rst
> > > > > index f05a9afb2c39..ed5ae24b196e 100644
> > > > > --- a/Documentation/RCU/arrayRCU.txt
> > > > > +++ b/Documentation/RCU/arrayRCU.rst
> > > > > @@ -1,5 +1,7 @@
> > > > > -Using RCU to Protect Read-Mostly Arrays
> > > > > +.. _array_rcu_doc:
> > > > > +Using RCU to Protect Read-Mostly Arrays
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >   Although RCU is more commonly used to protect linked lists, it
> can
> > > > >   also be used to protect arrays.  Three situations are as follow=
s:
> > > > > @@ -26,6 +28,7 @@ described in the following sections.
> > > >
> > > > It will be better to have the cross reference for each situation.
> > > >
> > > > Hash Tables
> > > > Static Arrays
> > > > Resizeable Arrays
> > >
> > > Madhuparna, could you please put a patch together creating these
> > > cross-references and handling Phong's comments below (probably
> > > by getting rid of the "." so that the resulting ":" doesn't look
> > > strange)?
> > >
> > > Then I will fold that patch into your original commit in -rcu and
> > > add Phong's Tested-by.
> > >
> > >                                                     Thanx, Paul
> > >
> > > > >   Situation 1: Hash Tables
> > > > > +------------------------
> > > > >   Hash tables are often implemented as an array, where each array
> entry
> > > > >   has a linked-list hash chain.  Each hash chain can be protected
> by RCU
> > > > > @@ -34,6 +37,7 @@ to other array-of-list situations, such as radi=
x
> trees.
> > > > >   Situation 2: Static Arrays
> > > > > +--------------------------
> > > > >   Static arrays, where the data (rather than a pointer to the
> data) is
> > > > >   located in each array element, and where the array is never
> resized,
> > > > > @@ -41,11 +45,13 @@ have not been used with RCU.  Rik van Riel
> recommends using seqlock in
> > > > >   this situation, which would also have minimal read-side overhea=
d
> as long
> > > > >   as updates are rare.
> > > > > -Quick Quiz:  Why is it so important that updates be rare when
> > > > > -            using seqlock?
> > > > > +Quick Quiz:
> > > > > +               Why is it so important that updates be rare when
> using seqlock?
> > > > > +:ref:`Answer to Quick Quiz <answer_quick_quiz_seqlock>`
> > > > >   Situation 3: Resizeable Arrays
> > > > > +------------------------------
> > > > >   Use of RCU for resizeable arrays is demonstrated by the
> grow_ary()
> > > > >   function formerly used by the System V IPC code.  The array is
> used
> > > > > @@ -60,7 +66,7 @@ the remainder of the new, updates the
> ids->entries pointer to point to
> > > > >   the new array, and invokes ipc_rcu_putref() to free up the old
> array.
> > > > >   Note that rcu_assign_pointer() is used to update the
> ids->entries pointer,
> > > > >   which includes any memory barriers required on whatever
> architecture
> > > > > -you are running on.
> > > > > +you are running on.::
> > > >
> > > > a redundant ":" in here with html page.
> > > >
> > > >
> > > >
> > > >
> > > > >         static int grow_ary(struct ipc_ids* ids, int newsize)
> > > > >         {
> > > > > @@ -112,7 +118,7 @@ a simple check suffices.  The pointer to the
> structure corresponding
> > > > >   to the desired IPC object is placed in "out", with NULL
> indicating
> > > > >   a non-existent entry.  After acquiring "out->lock", the
> "out->deleted"
> > > > >   flag indicates whether the IPC object is in the process of bein=
g
> > > > > -deleted, and, if not, the pointer is returned.
> > > > > +deleted, and, if not, the pointer is returned.::
> > > >
> > > > same as above
> > > >
> > > >
> > > > Tested-by: Phong Tran <tranmanphong@gmail.com>
> > > >
> > > > Regards,
> > > > Phong.
> > > >
> > > > >         struct kern_ipc_perm* ipc_lock(struct ipc_ids* ids, int i=
d)
> > > > >         {
> > > > > @@ -144,8 +150,10 @@ deleted, and, if not, the pointer is returne=
d.
> > > > >                 return out;
> > > > >         }
> > > > > +.. _answer_quick_quiz_seqlock:
> > > > >   Answer to Quick Quiz:
> > > > > +       Why is it so important that updates be rare when using
> seqlock?
> > > > >         The reason that it is important that updates be rare when
> > > > >         using seqlock is that frequent updates can livelock
> readers.
> > > > > diff --git a/Documentation/RCU/index.rst
> b/Documentation/RCU/index.rst
> > > > > index 5c99185710fa..8d20d44f8fd4 100644
> > > > > --- a/Documentation/RCU/index.rst
> > > > > +++ b/Documentation/RCU/index.rst
> > > > > @@ -7,6 +7,7 @@ RCU concepts
> > > > >   .. toctree::
> > > > >      :maxdepth: 3
> > > > > +   arrayRCU
> > > > >      rcu
> > > > >      listRCU
> > > > >      UP
> > > > >
> > > _______________________________________________
> > > Linux-kernel-mentees mailing list
> > > Linux-kernel-mentees@lists.linuxfoundation.org
> > >
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
> >
> > Hey,
> > There are a few instances in the document where words are
> > emphasized. Example, -not- in the first paragraph. The
> > previous emphasis was correct wrt txt format, but this
> > could be converted to italicize/bold to keep up with the
> > reST format. Other than this and what Phong suggested,
> > everything looks good!
> >
> > Tested-by: Amol Grover <frextrite@gmail.com>
>
> Thank you, Amol!
>
> Madhuparna, could you please also include a fix to the "-not-"
> text-emphasis issue (and any other occurrences) that Amol located?
>
> I can then add both Phong's and Amol's Tested-by.
>
>                                                         Thanx, Paul
>

--000000000000918ada0596a03729
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you Amol and Phong for your valuable feedback. I hav=
e made the changes requested and sent the patch.<div><br></div><div><a href=
=3D"https://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/2019-N=
ovember/001055.html" target=3D"_blank">https://lists.linuxfoundation.org/pi=
permail/linux-kernel-mentees/2019-November/001055.html</a><br></div><div><b=
r></div><div>Regards,</div><div>Madhuparna</div></div><div hspace=3D"streak=
-pt-mark" style=3D"max-height:1px"><img alt=3D"" style=3D"width:0px;max-hei=
ght:0px;overflow:hidden" src=3D"https://mailfoogae.appspot.com/t?sender=3Da=
bWFkaHVwYXJuYWJob3dtaWswNEBnbWFpbC5jb20%3D&amp;type=3Dzerocontent&amp;guid=
=3D9c13d0fb-d0cd-4e01-9df0-988426ad16bd"><font color=3D"#ffffff" size=3D"1"=
>=E1=90=A7</font></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Nov 5, 2019 at 8:15 PM Paul E. McKenney &lt;<a hre=
f=3D"mailto:paulmck@kernel.org">paulmck@kernel.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Nov 05, 2019 at 0=
8:03:44PM +0530, Amol Grover wrote:<br>
&gt; On Tue, Nov 05, 2019 at 06:04:11AM -0800, Paul E. McKenney wrote:<br>
&gt; &gt; On Tue, Nov 05, 2019 at 08:49:47PM +0700, Phong Tran wrote:<br>
&gt; &gt; &gt; On 10/29/19 3:24 AM, <a href=3D"mailto:madhuparnabhowmik04@g=
mail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a> wrote:<br>
&gt; &gt; &gt; &gt; From: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhupar=
nabhowmik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&=
gt;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; This patch converts arrayRCU from txt to rst format.<br=
>
&gt; &gt; &gt; &gt; arrayRCU.rst is also added in the index.rst file.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Signed-off-by: Madhuparna Bhowmik &lt;<a href=3D"mailto=
:madhuparnabhowmik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail=
.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0.../RCU/{arrayRCU.txt =3D&gt; arrayRCU.rst}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 +++++++++++++-----<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0Documentation/RCU/index.rst=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A02 files changed, 14 insertions(+), 5 deleti=
ons(-)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0rename Documentation/RCU/{arrayRCU.txt =3D&=
gt; arrayRCU.rst} (91%)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; diff --git a/Documentation/RCU/arrayRCU.txt b/Documenta=
tion/RCU/arrayRCU.rst<br>
&gt; &gt; &gt; &gt; similarity index 91%<br>
&gt; &gt; &gt; &gt; rename from Documentation/RCU/arrayRCU.txt<br>
&gt; &gt; &gt; &gt; rename to Documentation/RCU/arrayRCU.rst<br>
&gt; &gt; &gt; &gt; index f05a9afb2c39..ed5ae24b196e 100644<br>
&gt; &gt; &gt; &gt; --- a/Documentation/RCU/arrayRCU.txt<br>
&gt; &gt; &gt; &gt; +++ b/Documentation/RCU/arrayRCU.rst<br>
&gt; &gt; &gt; &gt; @@ -1,5 +1,7 @@<br>
&gt; &gt; &gt; &gt; -Using RCU to Protect Read-Mostly Arrays<br>
&gt; &gt; &gt; &gt; +.. _array_rcu_doc:<br>
&gt; &gt; &gt; &gt; +Using RCU to Protect Read-Mostly Arrays<br>
&gt; &gt; &gt; &gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0Although RCU is more commonly used to prote=
ct linked lists, it can<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0also be used to protect arrays.=C2=A0 Three=
 situations are as follows:<br>
&gt; &gt; &gt; &gt; @@ -26,6 +28,7 @@ described in the following sections.<=
br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; It will be better to have the cross reference for each situa=
tion.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Hash Tables<br>
&gt; &gt; &gt; Static Arrays<br>
&gt; &gt; &gt; Resizeable Arrays<br>
&gt; &gt; <br>
&gt; &gt; Madhuparna, could you please put a patch together creating these<=
br>
&gt; &gt; cross-references and handling Phong&#39;s comments below (probabl=
y<br>
&gt; &gt; by getting rid of the &quot;.&quot; so that the resulting &quot;:=
&quot; doesn&#39;t look<br>
&gt; &gt; strange)?<br>
&gt; &gt; <br>
&gt; &gt; Then I will fold that patch into your original commit in -rcu and=
<br>
&gt; &gt; add Phong&#39;s Tested-by.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0Situation 1: Hash Tables<br>
&gt; &gt; &gt; &gt; +------------------------<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0Hash tables are often implemented as an arr=
ay, where each array entry<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0has a linked-list hash chain.=C2=A0 Each ha=
sh chain can be protected by RCU<br>
&gt; &gt; &gt; &gt; @@ -34,6 +37,7 @@ to other array-of-list situations, su=
ch as radix trees.<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0Situation 2: Static Arrays<br>
&gt; &gt; &gt; &gt; +--------------------------<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0Static arrays, where the data (rather than =
a pointer to the data) is<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0located in each array element, and where th=
e array is never resized,<br>
&gt; &gt; &gt; &gt; @@ -41,11 +45,13 @@ have not been used with RCU.=C2=A0 =
Rik van Riel recommends using seqlock in<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0this situation, which would also have minim=
al read-side overhead as long<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0as updates are rare.<br>
&gt; &gt; &gt; &gt; -Quick Quiz:=C2=A0 Why is it so important that updates =
be rare when<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 using seqloc=
k?<br>
&gt; &gt; &gt; &gt; +Quick Quiz:<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Why is it so important that updates be rare when using seqlock?<br>
&gt; &gt; &gt; &gt; +:ref:`Answer to Quick Quiz &lt;answer_quick_quiz_seqlo=
ck&gt;`<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0Situation 3: Resizeable Arrays<br>
&gt; &gt; &gt; &gt; +------------------------------<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0Use of RCU for resizeable arrays is demonst=
rated by the grow_ary()<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0function formerly used by the System V IPC =
code.=C2=A0 The array is used<br>
&gt; &gt; &gt; &gt; @@ -60,7 +66,7 @@ the remainder of the new, updates the=
 ids-&gt;entries pointer to point to<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0the new array, and invokes ipc_rcu_putref()=
 to free up the old array.<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0Note that rcu_assign_pointer() is used to u=
pdate the ids-&gt;entries pointer,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0which includes any memory barriers required=
 on whatever architecture<br>
&gt; &gt; &gt; &gt; -you are running on.<br>
&gt; &gt; &gt; &gt; +you are running on.::<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; a redundant &quot;:&quot; in here with html page.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static int grow_ary(st=
ruct ipc_ids* ids, int newsize)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; &gt; &gt; @@ -112,7 +118,7 @@ a simple check suffices.=C2=A0 The =
pointer to the structure corresponding<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0to the desired IPC object is placed in &quo=
t;out&quot;, with NULL indicating<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0a non-existent entry.=C2=A0 After acquiring=
 &quot;out-&gt;lock&quot;, the &quot;out-&gt;deleted&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0flag indicates whether the IPC object is in=
 the process of being<br>
&gt; &gt; &gt; &gt; -deleted, and, if not, the pointer is returned.<br>
&gt; &gt; &gt; &gt; +deleted, and, if not, the pointer is returned.::<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; same as above<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Tested-by: Phong Tran &lt;<a href=3D"mailto:tranmanphong@gma=
il.com" target=3D"_blank">tranmanphong@gmail.com</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; Phong.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct kern_ipc_perm* =
ipc_lock(struct ipc_ids* ids, int id)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; &gt; &gt; @@ -144,8 +150,10 @@ deleted, and, if not, the pointer =
is returned.<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return out;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; +.. _answer_quick_quiz_seqlock:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0Answer to Quick Quiz:<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Why is it so important that=
 updates be rare when using seqlock?<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The reason that it is =
important that updates be rare when<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0using seqlock is that =
frequent updates can livelock readers.<br>
&gt; &gt; &gt; &gt; diff --git a/Documentation/RCU/index.rst b/Documentatio=
n/RCU/index.rst<br>
&gt; &gt; &gt; &gt; index 5c99185710fa..8d20d44f8fd4 100644<br>
&gt; &gt; &gt; &gt; --- a/Documentation/RCU/index.rst<br>
&gt; &gt; &gt; &gt; +++ b/Documentation/RCU/index.rst<br>
&gt; &gt; &gt; &gt; @@ -7,6 +7,7 @@ RCU concepts<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0.. toctree::<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 :maxdepth: 3<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0arrayRCU<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 rcu<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 listRCU<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 UP<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Linux-kernel-mentees mailing list<br>
&gt; &gt; <a href=3D"mailto:Linux-kernel-mentees@lists.linuxfoundation.org"=
 target=3D"_blank">Linux-kernel-mentees@lists.linuxfoundation.org</a><br>
&gt; &gt; <a href=3D"https://lists.linuxfoundation.org/mailman/listinfo/lin=
ux-kernel-mentees" rel=3D"noreferrer" target=3D"_blank">https://lists.linux=
foundation.org/mailman/listinfo/linux-kernel-mentees</a><br>
&gt; <br>
&gt; Hey,<br>
&gt; There are a few instances in the document where words are<br>
&gt; emphasized. Example, -not- in the first paragraph. The <br>
&gt; previous emphasis was correct wrt txt format, but this<br>
&gt; could be converted to italicize/bold to keep up with the<br>
&gt; reST format. Other than this and what Phong suggested,<br>
&gt; everything looks good!<br>
&gt; <br>
&gt; Tested-by: Amol Grover &lt;<a href=3D"mailto:frextrite@gmail.com" targ=
et=3D"_blank">frextrite@gmail.com</a>&gt;<br>
<br>
Thank you, Amol!<br>
<br>
Madhuparna, could you please also include a fix to the &quot;-not-&quot;<br=
>
text-emphasis issue (and any other occurrences) that Amol located?<br>
<br>
I can then add both Phong&#39;s and Amol&#39;s Tested-by.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanx, Paul<br>
</blockquote></div>

--000000000000918ada0596a03729--

--===============2137311031947016748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2137311031947016748==--
