Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D6DC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 May 2022 12:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F37D3415A9;
	Wed, 25 May 2022 12:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pAxqRxQ7BsQI; Wed, 25 May 2022 12:52:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9A2A84154D;
	Wed, 25 May 2022 12:52:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C79AC0039;
	Wed, 25 May 2022 12:52:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F765C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 12:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F584612DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 12:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MdlLuNBS8O6L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 12:52:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABB0060B4B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 12:52:27 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id u30so35827975lfm.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 05:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=BbNvmQaECM5l1pCL3HNrc9WBwZPoFFh50ZLFmyCx7X8=;
 b=cBiG2lvrHlwTjbtFS9yOvI1R+oqQiTC1uBdKchyYgybnL3cI3phagMkc393u3n3vnZ
 ynDwrz0IkFPbEwnt6S+2DGBA1ZeZdiOIoQydH/7A9Kp3GZTQ9QXrSphkX2eIl92K77n3
 Q0I9IXJMRLFpukUJtsL9JD33GWtF559cq6BhbygVXtl7CoeQMgDFg77tvgM+dcFhJ+fM
 L67z0znRHGQh121DqHYkWX5JR5pGT7Gk7MRygnXn9EijGzY52NQmVLMMb2mMSb/o7KOX
 cJvfPLrb20p6bJxRGhViHBlu9yqb3GxNGlRtq11pkr6ReoqSsPup1dWNeuSKb4BeL1xV
 UB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=BbNvmQaECM5l1pCL3HNrc9WBwZPoFFh50ZLFmyCx7X8=;
 b=yUE84IlQITrJoZcEhHJiLeSDIOcTCDjdkQjsGoC3knodilCAMh8LOu2LpQ/CRKivZR
 GYEJngvygUEbnAMNB+mmO99n8bYxdjNCFujVNFhecGqqmkEz/19kmGUm1NawivMN0Sss
 nz2UcQDV9rs+YYHQ8kthU/xB29pTbMENdccu/f8i56wSxj3VrDvOx7LH7F78QDahnvq5
 G3UNUePtja+8sJuKgnJ2OKr3fGg9pAu9Y13j/dOLyCYq/LfbcDcg/I7jC1bvlPldjgIW
 xoZ9SrDw+nWv1h3L8L16xpVwFiFn3aCvOdPXY4o8JkjoJpq+1ht50zl16biYRmQgB6G9
 kiGw==
X-Gm-Message-State: AOAM532qjpDTb/r0Jc77UB/pAAPcog19lxBqqzTiDsvsRQ2CdgQ9kH/1
 bouQrBmqkuiaTs1ysA9kk7/d0sQSI+GbpJZydMRHfAI8
X-Google-Smtp-Source: ABdhPJxzqQCW2ekVM6jc84OrMZRc8gcN0QKDDuCdBAl66Zu8QxOkqJwQVcPlU1C+UioPQb28twroIo0JbiZv9PwTwI0=
X-Received: by 2002:a05:6512:4020:b0:478:96b3:92e3 with SMTP id
 br32-20020a056512402000b0047896b392e3mr4699716lfb.276.1653483145320; Wed, 25
 May 2022 05:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.15.1653480003.4276.linux-kernel-mentees@lists.linuxfoundation.org>
In-Reply-To: <mailman.15.1653480003.4276.linux-kernel-mentees@lists.linuxfoundation.org>
From: Ankita Pareek <ankitapareek2000@gmail.com>
Date: Wed, 25 May 2022 18:22:12 +0530
Message-ID: <CAG+8pO4SkYDd6NHizMk64MubBDxYdwtwXmdLuZv6cHxKgqmPXA@mail.gmail.com>
Subject: Re: Linux-kernel-mentees Digest, Vol 38, Issue 7
To: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============2074963968906720685=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2074963968906720685==
Content-Type: multipart/alternative; boundary="00000000000084de3c05dfd58b6d"

--00000000000084de3c05dfd58b6d
Content-Type: text/plain; charset="UTF-8"

Unsubscribe

On Wed, 25 May 2022, 17:30 , <
linux-kernel-mentees-request@lists.linuxfoundation.org> wrote:

> Send Linux-kernel-mentees mailing list submissions to
>         linux-kernel-mentees@lists.linuxfoundation.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
>
> or, via email, send a message with subject or body 'help' to
>         linux-kernel-mentees-request@lists.linuxfoundation.org
>
> You can reach the person managing the list at
>         linux-kernel-mentees-owner@lists.linuxfoundation.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Linux-kernel-mentees digest..."
>
>
> Today's Topics:
>
>    1. Re: [PATCH] ipc: Remove dead code in perform_atomic_semop()
>       (Vasily Averin)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Wed, 25 May 2022 07:20:40 +0300
> From: Vasily Averin <vasily.averin@linux.dev>
> To: Gautam Menghani <gautammenghani201@gmail.com>,
>         akpm@linux-foundation.org,  shakeelb@google.com, mhocko@suse.com,
>         manfred@colorfullife.com
> Cc: linux-kernel-mentees@lists.linuxfoundation.org,
>         linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] ipc: Remove dead code in perform_atomic_semop()
> Message-ID: <3e686290-14e4-a4e9-3825-afb011b8c0e4@linux.dev>
> Content-Type: text/plain; charset=UTF-8
>
> On 5/25/22 02:12, vasily.averin@linux.dev wrote:
> > On 5/24/22 21:22, Gautam Menghani wrote:
> >> Remove the line which is dead code. Fixes the clang scan warning:
> >> warning: Value stored to 'result' is never read [deadcode.DeadStores]
> >>                 result = curr->semval;
> >>
> >> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> >> ---
> >>  ipc/sem.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/ipc/sem.c b/ipc/sem.c
> >> index 0dbdb98fdf2d..156824bcda47 100644
> >> --- a/ipc/sem.c
> >> +++ b/ipc/sem.c
> >> @@ -766,7 +766,6 @@ static int perform_atomic_semop(struct sem_array
> *sma, struct sem_queue *q)
> >>      for (sop = sops; sop < sops + nsops; sop++) {
> >>              curr = &sma->sems[sop->sem_num];
> >>              sem_op = sop->sem_op;
> >> -            result = curr->semval;
> >>
> >>              if (sop->sem_flg & SEM_UNDO) {
> >>                      int undo = un->semadj[sop->sem_num] - sem_op;
> >
> > Perhaps it would be better to keep the "result" but use it in the
> > marked line below, like it was done in previous part of this function?
>
> Sorry, I was wrong.
> Reviewed-by: Vasily Averin <vvs@openvz.org>
>
>
> ------------------------------
>
> Subject: Digest Footer
>
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
>
>
> ------------------------------
>
> End of Linux-kernel-mentees Digest, Vol 38, Issue 7
> ***************************************************
>

--00000000000084de3c05dfd58b6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Unsubscribe</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 25 May 2022, 17:30 , &lt;<a href=3D"m=
ailto:linux-kernel-mentees-request@lists.linuxfoundation.org">linux-kernel-=
mentees-request@lists.linuxfoundation.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Send Linux-kernel-mentees mailing list submissions to=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel-mentees@lists.li=
nuxfoundation.org" target=3D"_blank" rel=3D"noreferrer">linux-kernel-mentee=
s@lists.linuxfoundation.org</a><br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lists.linuxfoundation.org/ma=
ilman/listinfo/linux-kernel-mentees" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel=
-mentees</a><br>
<br>
or, via email, send a message with subject or body &#39;help&#39; to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel-mentees-request@=
lists.linuxfoundation.org" target=3D"_blank" rel=3D"noreferrer">linux-kerne=
l-mentees-request@lists.linuxfoundation.org</a><br>
<br>
You can reach the person managing the list at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel-mentees-owner@li=
sts.linuxfoundation.org" target=3D"_blank" rel=3D"noreferrer">linux-kernel-=
mentees-owner@lists.linuxfoundation.org</a><br>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of Linux-kernel-mentees digest...&quot;<br>
<br>
<br>
Today&#39;s Topics:<br>
<br>
=C2=A0 =C2=A01. Re: [PATCH] ipc: Remove dead code in perform_atomic_semop()=
<br>
=C2=A0 =C2=A0 =C2=A0 (Vasily Averin)<br>
<br>
<br>
----------------------------------------------------------------------<br>
<br>
Message: 1<br>
Date: Wed, 25 May 2022 07:20:40 +0300<br>
From: Vasily Averin &lt;<a href=3D"mailto:vasily.averin@linux.dev" target=
=3D"_blank" rel=3D"noreferrer">vasily.averin@linux.dev</a>&gt;<br>
To: Gautam Menghani &lt;<a href=3D"mailto:gautammenghani201@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">gautammenghani201@gmail.com</a>&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:akpm@linux-foundation.org" ta=
rget=3D"_blank" rel=3D"noreferrer">akpm@linux-foundation.org</a>,=C2=A0 <a =
href=3D"mailto:shakeelb@google.com" target=3D"_blank" rel=3D"noreferrer">sh=
akeelb@google.com</a>, <a href=3D"mailto:mhocko@suse.com" target=3D"_blank"=
 rel=3D"noreferrer">mhocko@suse.com</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:manfred@colorfullife.com" tar=
get=3D"_blank" rel=3D"noreferrer">manfred@colorfullife.com</a><br>
Cc: <a href=3D"mailto:linux-kernel-mentees@lists.linuxfoundation.org" targe=
t=3D"_blank" rel=3D"noreferrer">linux-kernel-mentees@lists.linuxfoundation.=
org</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel@vger.kernel.org"=
 target=3D"_blank" rel=3D"noreferrer">linux-kernel@vger.kernel.org</a><br>
Subject: Re: [PATCH] ipc: Remove dead code in perform_atomic_semop()<br>
Message-ID: &lt;<a href=3D"mailto:3e686290-14e4-a4e9-3825-afb011b8c0e4@linu=
x.dev" target=3D"_blank" rel=3D"noreferrer">3e686290-14e4-a4e9-3825-afb011b=
8c0e4@linux.dev</a>&gt;<br>
Content-Type: text/plain; charset=3DUTF-8<br>
<br>
On 5/25/22 02:12, <a href=3D"mailto:vasily.averin@linux.dev" target=3D"_bla=
nk" rel=3D"noreferrer">vasily.averin@linux.dev</a> wrote:<br>
&gt; On 5/24/22 21:22, Gautam Menghani wrote:<br>
&gt;&gt; Remove the line which is dead code. Fixes the clang scan warning:<=
br>
&gt;&gt; warning: Value stored to &#39;result&#39; is never read [deadcode.=
DeadStores]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resul=
t =3D curr-&gt;semval;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Gautam Menghani &lt;<a href=3D"mailto:gautammenghan=
i201@gmail.com" target=3D"_blank" rel=3D"noreferrer">gautammenghani201@gmai=
l.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 ipc/sem.c | 1 -<br>
&gt;&gt;=C2=A0 1 file changed, 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/ipc/sem.c b/ipc/sem.c<br>
&gt;&gt; index 0dbdb98fdf2d..156824bcda47 100644<br>
&gt;&gt; --- a/ipc/sem.c<br>
&gt;&gt; +++ b/ipc/sem.c<br>
&gt;&gt; @@ -766,7 +766,6 @@ static int perform_atomic_semop(struct sem_arr=
ay *sma, struct sem_queue *q)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 for (sop =3D sops; sop &lt; sops + nsops; sop+=
+) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curr =3D &amp;sma-=
&gt;sems[sop-&gt;sem_num];<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sem_op =3D sop-&gt=
;sem_op;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D curr-&gt;sem=
val;<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sop-&gt;sem_fl=
g &amp; SEM_UNDO) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int undo =3D un-&gt;semadj[sop-&gt;sem_num] - sem_op;<br>
&gt; <br>
&gt; Perhaps it would be better to keep the &quot;result&quot; but use it i=
n the<br>
&gt; marked line below, like it was done in previous part of this function?=
<br>
<br>
Sorry, I was wrong.<br>
Reviewed-by: Vasily Averin &lt;<a href=3D"mailto:vvs@openvz.org" target=3D"=
_blank" rel=3D"noreferrer">vvs@openvz.org</a>&gt;<br>
<br>
<br>
------------------------------<br>
<br>
Subject: Digest Footer<br>
<br>
_______________________________________________<br>
Linux-kernel-mentees mailing list<br>
<a href=3D"mailto:Linux-kernel-mentees@lists.linuxfoundation.org" target=3D=
"_blank" rel=3D"noreferrer">Linux-kernel-mentees@lists.linuxfoundation.org<=
/a><br>
<a href=3D"https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-=
mentees" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.linu=
xfoundation.org/mailman/listinfo/linux-kernel-mentees</a><br>
<br>
<br>
------------------------------<br>
<br>
End of Linux-kernel-mentees Digest, Vol 38, Issue 7<br>
***************************************************<br>
</blockquote></div>

--00000000000084de3c05dfd58b6d--

--===============2074963968906720685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2074963968906720685==--
