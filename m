Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DEAR_SOMETHING,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6642CC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 21:11:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C118F206CA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 21:11:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpktmvAi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C118F206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4F39D87218;
	Mon, 12 Oct 2020 21:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hqcEfBfHngPh; Mon, 12 Oct 2020 21:11:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 658B987203;
	Mon, 12 Oct 2020 21:11:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AD1CC07FF;
	Mon, 12 Oct 2020 21:11:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD9D3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 21:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AC7FC872D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 21:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WIiZ+7mz9P2k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 21:11:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C9EFC86865
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 21:11:29 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id j7so2579212oie.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 14:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=095Xiukyv4ytYsTAZzj0QPDJvoGmwEo/X3NkoBnKIEE=;
 b=mpktmvAibo4gwBUFoCdxJHpFXhLEivEkZsUybCN16Yg+wIhopga5WerpL1pjdIt83g
 9sj0X7h0LJFHHyzSYludNSsW0n5yXobFKTjQ5xQZe0dOHrzHScMgXntp5bqs5BCoBI2v
 gN7dPDXffGIrnipU9j0HTTYEe2y2irhUx1srDTifGUw8pYgieivmFT5lmJzAGYPd1jhO
 5yae9ryh3xA0efWoYWmWz7QQ3DjUXUz3WGyi/hKuD1gSon9wZrY0fRhk79YNJXLXlIIA
 o/wwO5S+prgQSkLttGUgSdDOzGJCFkFy/Y1YpwtIWjfOhQSpowgfSwLYWi/E7+bkOta+
 26Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=095Xiukyv4ytYsTAZzj0QPDJvoGmwEo/X3NkoBnKIEE=;
 b=NNKH6QG1A9JVK6L4+2gCSX+h3Zi3zAxmpYUnrp6pHqEhHo6/1IukShVQCkBTpfu+1c
 NQ4PyDvvtBPG2AxXMhdXl+PhEtg9VczZeJonRW2fZocB3CmROGPqOWKfj8WCfGPpsefK
 tVD+ak22b1//5iD2zZfAhrNiycnZjJX42tYn8yovidb2hB6wDw+0BeV3Ekdb2OaIGwNy
 cOJotWKyJ+7dyCeKB+4lG28s40Aq7wZolxfLnFbiXyYuitXgOCDhpr2BTz9LP+LF7mEx
 P4aCsq4wWcSZ89uOaBlMJVu5o4BfGzqlZzAhjC/0b8e7kVPcRhl2VpTssXH3rLM7/acG
 osww==
X-Gm-Message-State: AOAM5313pkwr6BSyopQAhN2Wkwpa32WAA05HYH8HPTOAg+Cgnlj1oZBA
 ULoNis3iiQ6otRQy3KwcuKsc4frQHW9CHe7HVEU=
X-Google-Smtp-Source: ABdhPJwYubxsq1ST7+OXKuu18eVMV9N3PrZwW8kAYRrOpq4anseiSGJveHgYSpeWvW8fZZBVBCH/lRsxnxEBM7pg2OE=
X-Received: by 2002:a05:6808:686:: with SMTP id
 k6mr11993759oig.129.1602537088878; 
 Mon, 12 Oct 2020 14:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ7RK2spHzFJxAqkm+N=T4ZB8-SeqgCX+Bs5r5__eLJRbovL3w@mail.gmail.com>
 <CAKXUXMxyTdNSK0gR4FMkp29TrYX_G2Hwqor4UY2cWk45POyocQ@mail.gmail.com>
 <a1675970-9eb9-bd6a-31ff-d04f88ca30e2@gmail.com>
 <CAKXUXMy6AawtRNB6B3pPQK_QNT+NK1VT9QUBKQ4YGV-QbAkvBA@mail.gmail.com>
In-Reply-To: <CAKXUXMy6AawtRNB6B3pPQK_QNT+NK1VT9QUBKQ4YGV-QbAkvBA@mail.gmail.com>
From: Aditya Srivastava <yashsri421@gmail.com>
Date: Tue, 13 Oct 2020 02:41:16 +0530
Message-ID: <CAJ7RK2vQb=b6kGmZ3Xd7UKk9gieZbX+-CrTybqoksqjEh6m7Lg@mail.gmail.com>
To: dwaipayanray1@gmail.com
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Checkpatch.pl tasks for Community Bridge
	Program
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
Content-Type: multipart/mixed; boundary="===============0034936867519491601=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0034936867519491601==
Content-Type: multipart/alternative; boundary="000000000000ec129605b17fbd40"

--000000000000ec129605b17fbd40
Content-Type: text/plain; charset="UTF-8"

On Mon 12 Oct, 2020, 11:58 PM Lukas Bulwahn, <lukas.bulwahn@gmail.com>
wrote:

> On Mon, Oct 12, 2020 at 8:23 PM Dwaipayan Ray <dwaipayanray1@gmail.com>
> wrote:
> >
> >
> > On 12/10/20 6:27 pm, Lukas Bulwahn wrote:
> > > On Mon, Oct 12, 2020 at 11:38 AM Aditya Srivastava <
> yashsri421@gmail.com> wrote:
> > >> Dear Sir/Ma'am
> > >> I have performed some tasks on Checkpatch.pl to find out the
> aggregate and summary of Errors and Warnings that have been generated on
> certain Linux Kernel Versions' commits . The summary of my tasks are as
> follows:
> > >> 1. Task1: Create a list of all non-merge commits that were added in
> the version v5.8 but were not there in v5.7. Run checkpatch.pl script on
> these commits and create a statistical summary of findings.
> > >> My findings:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task1/reports/aggregate_report/analysis/summary.txt
> > >> My Scripts for this task:
> https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task1
> > >>
> > >> 2. Task2: Test what are errors and warnings by checkpatch.pl reports
> on v5.6..v5.8. Generate a report with respect to changes suggested by
> Dwaipayan Ray (
> https://lore.kernel.org/linux-kernel-mentees/20201007192029.551744-1-dwaipayanray1@gmail.com/),
> to present the differences in a suitable aggregated form, to find out the
> kind of errors and warnings that are changing.
> > >>
> > >> My Findings:
> > >> Change in the number of warnings and errors:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt
> > >>
> > >> Individual summary report generated by checkpatch.pl:
> > >> After the commit:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/after_commit/summary_after_commit.txt
> > >>
> > >> Before the commit:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/before_commit/summary_before_commit.txt
> > >>
> > >> Scripts used for this task:
> https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task2
> > >>
> > > Your email client is broken; you cannot send emails to a kernel
> > > mailing list with this email setup. I will not bother to use a proper
> > > email client either :)
> > >
> > > summary at
> > >
> > >
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt
> > >
> > > looks good.
> > >
> > > Dwaipayan probably needs to look into the details here.
> > >
> > > E.g., why did those really unrelated issues change?
> > >
> > > AVOID_BUG 240 239
> > > TYPO_SPELLING 536 537
> >
> > Ya, this shouldn't happen.
> >
> > I checked the reports, and the new warnings appear as expected.
> >
> > Could Aditya perhaps find out which errors in this case have changed?
> >
>
> Dwaipayan, you can ask Aditya directly :)
>
> Aditya, can you help us and tell us which AVOID_BUG remained the same,
> which appeared, and which disappeared?
>
> And the same for TYPO_SPELLING.
>
> Lukas
>

Sure thing sir. But currently I can't access these files as my laptop's
hardware is broken. I'll get it repaired tomorrow morning  and will be on
it by the evening.
Really sorry for the inconvenience caused.

Aditya

>

--000000000000ec129605b17fbd40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon 12 Oct, 2020, 11:58 PM Lukas Bulwahn, &lt;<a href=
=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On Mon, Oct 12, 2020 at 8:23 PM Dwa=
ipayan Ray &lt;<a href=3D"mailto:dwaipayanray1@gmail.com" target=3D"_blank"=
 rel=3D"noreferrer">dwaipayanray1@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 12/10/20 6:27 pm, Lukas Bulwahn wrote:<br>
&gt; &gt; On Mon, Oct 12, 2020 at 11:38 AM Aditya Srivastava &lt;<a href=3D=
"mailto:yashsri421@gmail.com" target=3D"_blank" rel=3D"noreferrer">yashsri4=
21@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; Dear Sir/Ma&#39;am<br>
&gt; &gt;&gt; I have performed some tasks on Checkpatch.pl to find out the =
aggregate and summary of Errors and Warnings that have been generated on ce=
rtain Linux Kernel Versions&#39; commits . The summary of my tasks are as f=
ollows:<br>
&gt; &gt;&gt; 1. Task1: Create a list of all non-merge commits that were ad=
ded in the version v5.8 but were not there in v5.7. Run <a href=3D"http://c=
heckpatch.pl" rel=3D"noreferrer noreferrer" target=3D"_blank">checkpatch.pl=
</a> script on these commits and create a statistical summary of findings.<=
br>
&gt; &gt;&gt; My findings: <a href=3D"https://github.com/AdityaSrivast/kern=
el-tasks/blob/master/Task1/reports/aggregate_report/analysis/summary.txt" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/AdityaSri=
vast/kernel-tasks/blob/master/Task1/reports/aggregate_report/analysis/summa=
ry.txt</a><br>
&gt; &gt;&gt; My Scripts for this task: <a href=3D"https://github.com/Adity=
aSrivast/kernel-tasks/tree/master/Task1" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://github.com/AdityaSrivast/kernel-tasks/tree/master/Tas=
k1</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 2. Task2: Test what are errors and warnings by <a href=3D"htt=
p://checkpatch.pl" rel=3D"noreferrer noreferrer" target=3D"_blank">checkpat=
ch.pl</a> reports on v5.6..v5.8. Generate a report with respect to changes =
suggested by Dwaipayan Ray (<a href=3D"https://lore.kernel.org/linux-kernel=
-mentees/20201007192029.551744-1-dwaipayanray1@gmail.com/" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://lore.kernel.org/linux-kernel-mentee=
s/20201007192029.551744-1-dwaipayanray1@gmail.com/</a>), to present the dif=
ferences in a suitable aggregated form, to find out the kind of errors and =
warnings that are changing.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; My Findings:<br>
&gt; &gt;&gt; Change in the number of warnings and errors: <a href=3D"https=
://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis=
/relative_change/summary_relative.txt" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2=
/reports/analysis/relative_change/summary_relative.txt</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Individual summary report generated by <a href=3D"http://chec=
kpatch.pl" rel=3D"noreferrer noreferrer" target=3D"_blank">checkpatch.pl</a=
>:<br>
&gt; &gt;&gt; After the commit: <a href=3D"https://github.com/AdityaSrivast=
/kernel-tasks/blob/master/Task2/reports/analysis/after_commit/summary_after=
_commit.txt" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github=
.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/after_co=
mmit/summary_after_commit.txt</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Before the commit: <a href=3D"https://github.com/AdityaSrivas=
t/kernel-tasks/blob/master/Task2/reports/analysis/before_commit/summary_bef=
ore_commit.txt" rel=3D"noreferrer noreferrer" target=3D"_blank">https://git=
hub.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/befor=
e_commit/summary_before_commit.txt</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Scripts used for this task: <a href=3D"https://github.com/Adi=
tyaSrivast/kernel-tasks/tree/master/Task2" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://github.com/AdityaSrivast/kernel-tasks/tree/master/T=
ask2</a><br>
&gt; &gt;&gt;<br>
&gt; &gt; Your email client is broken; you cannot send emails to a kernel<b=
r>
&gt; &gt; mailing list with this email setup. I will not bother to use a pr=
oper<br>
&gt; &gt; email client either :)<br>
&gt; &gt;<br>
&gt; &gt; summary at<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://github.com/AdityaSrivast/kernel-tasks/blob/mas=
ter/Task2/reports/analysis/relative_change/summary_relative.txt" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">https://github.com/AdityaSrivast/kern=
el-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relativ=
e.txt</a><br>
&gt; &gt;<br>
&gt; &gt; looks good.<br>
&gt; &gt;<br>
&gt; &gt; Dwaipayan probably needs to look into the details here.<br>
&gt; &gt;<br>
&gt; &gt; E.g., why did those really unrelated issues change?<br>
&gt; &gt;<br>
&gt; &gt; AVOID_BUG 240 239<br>
&gt; &gt; TYPO_SPELLING 536 537<br>
&gt;<br>
&gt; Ya, this shouldn&#39;t happen.<br>
&gt;<br>
&gt; I checked the reports, and the new warnings appear as expected.<br>
&gt;<br>
&gt; Could Aditya perhaps find out which errors in this case have changed?<=
br>
&gt;<br>
<br>
Dwaipayan, you can ask Aditya directly :)<br>
<br>
Aditya, can you help us and tell us which AVOID_BUG remained the same,<br>
which appeared, and which disappeared?<br>
<br>
And the same for TYPO_SPELLING.<br>
<br>
Lukas<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Sure thing sir. But currently I can&#39;t access these files as my lap=
top&#39;s hardware is broken. I&#39;ll get it repaired tomorrow morning=C2=
=A0 and will be on it by the evening.=C2=A0</div><div dir=3D"auto">Really s=
orry for the inconvenience caused.=C2=A0</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Aditya</div><div dir=3D"auto"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000ec129605b17fbd40--

--===============0034936867519491601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0034936867519491601==--
