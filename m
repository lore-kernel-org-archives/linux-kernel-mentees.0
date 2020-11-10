Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D30C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 19:39:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A799620678
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 19:39:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t3KS0CLj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A799620678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C1C3322E8C;
	Tue, 10 Nov 2020 19:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DYrAWZ0VcMSf; Tue, 10 Nov 2020 19:39:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 117BE2033B;
	Tue, 10 Nov 2020 19:39:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E704BC088B;
	Tue, 10 Nov 2020 19:39:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 082DEC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 19:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DDD6522E8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 19:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HeVOj17DK0Dj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 19:39:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by silver.osuosl.org (Postfix) with ESMTPS id B09EC2033B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 19:39:42 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id e17so192894ili.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 11:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D9DdklNeQCC8JkPM62ceJ49uKzZasdmkB6PcV+J6Gl4=;
 b=t3KS0CLjZFxsfsYplxdybDX6Nfm7CgT0UVTgxcKH8p5PhbBcck8bjOMzDG/rYKQ/ts
 np//nPY8j17hokaH4hEG6+zgUN+ijS086cwAdpw95YsOaxXlgcg+eiRSw9fr6uMg3P1N
 3HPjPO1yiiRxNa6tRRMmVJfD7tNdV+0h/pvjvaKwFba0RHSYz/fe4Sn8glvKiAv5QTNO
 /iEbPuJTEB8crl3btFM6Ne/k1tLU7L7Wfb8egwpQWUwfXAyAysJDS1zSYB6C/jvU7XKt
 KMimZPMfeVn/jUPwPNjZg16qQnmK4SB/auR3M0AQmnxjvGlTw9yurW4qCbSEaredFidL
 PsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D9DdklNeQCC8JkPM62ceJ49uKzZasdmkB6PcV+J6Gl4=;
 b=jHtitu7QdBiuZIFATh7E11RwjDUdBMxMJkUZQEzYpcde6VBrkN8M1ItKw+WsxT7t5n
 sEbMysttgs8xBGy6RbmH0RxY+kb28Fimb34fHb/3hNACut/pZe1G+GhnGk72U5cxBFN4
 OquEPEwHRTNQFgnr9FL65qx/fs+rpMED81Vg+ivwfJAEDG58eBf89tsBUNqODQusb28c
 DENlPfrBoymB3LC6hl3JMReFSIRnVJPCokQfMBfdjpCFILSxg7A3Hd2QnSmQs5RukJUb
 IlwvfHScEiPFiia5TtXDcSmrFuCn5lOmLP7ll/UqYL8rcjzITfmxJ+a0Yhdvxfm9N4CL
 851A==
X-Gm-Message-State: AOAM533J1KMFllXv85VuZwRsRSLyQpeGQm7fTthpC0DhWrd5+56KGsw0
 /ZX7PsUzZR6ey3QeIX0mpg5ipdLu2o+cDLM11HA=
X-Google-Smtp-Source: ABdhPJxWbcvDROXpJQ0fW05KPHhmjuJ5RBLtZ/p0faVshI+6E0/M/r/fboU1jr62bY6N+t88Uku9gq+8MzBAIgRWT2M=
X-Received: by 2002:a92:cb51:: with SMTP id f17mr14928075ilq.64.1605037181809; 
 Tue, 10 Nov 2020 11:39:41 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5DjToH6UXKuKoyCk_vKZux1cBoD4yRpGsWBXM9iZS2fKw@mail.gmail.com>
In-Reply-To: <CABJPP5DjToH6UXKuKoyCk_vKZux1cBoD4yRpGsWBXM9iZS2fKw@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 10 Nov 2020 20:39:32 +0100
Message-ID: <CAKXUXMxN=_NjyfEsX4ufAyLGX23u7VRG5UCSEbLco5ALZGwh0g@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] git_commit_id false positives
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
Content-Type: multipart/mixed; boundary="===============4279540516782829378=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4279540516782829378==
Content-Type: multipart/alternative; boundary="00000000000012bacf05b3c5d785"

--00000000000012bacf05b3c5d785
Content-Type: text/plain; charset="UTF-8"

On Di., 10. Nov. 2020 at 19:41, Dwaipayan Ray <dwaipayanray1@gmail.com>
wrote:

> Hi,
> I was looking into GIT_COMMIT_ID warnings for checkpatch
> and certainly there are false positives which needs to be fixed
> as also said by a previous discussion.
>
> But before fixing it, I would like your comments on what should
> be fixed and what shouldn't considering the added code can
> be complex.
>
> The data below is an evaluation of about 50k commits from v5.4.
>
> $ cat checkpatch_out_50k.txt | grep -A3 "GIT_COMMIT_ID" \
>    | grep "References" | wc -l
> 45


> First of all there are 45 warnings of type:
> References: 2248a28384fe ("drm/i915/gen8+: Add RC6 CTX corruption WA")
> References: 860afa086841 ("drm/i915/gt: Flush gen7 even harder"), etc.
>
> Should references be simply exempt from this check? I don't
> know much about it. But seems checkpatch is incorrect here.
>

I understand what the authors intend to do. They want to refer to a commit
as a tag, such as Link: for URLs or Fixes: for commits that fixed another
commit. However, this format of using References: is not an agreed and
common convention.

We could ask on the mailing list if there is some preference for such a
common agreement. Then, we can extend the kernel process documentation and
add a rule for checking this convention in checkpatch.

Do you want to do that? Expect some heavy discussion and some bikeshedding.


> For other messages,
> $ cat checkpatch_out_50k.txt | grep -A3 "GIT_COMMIT_ID"  | \
>   grep -v "GIT_COMMIT_ID" |     grep -P "^\s*[a-z0-9]{12,}" | wc -l
> 468
>
> There were 468 missing "commit" word before the GIT SHA. Some
> of these were due to split lines. I think that could be fixed with some
> effort.
>
> And finally the other fixable warning is for those with split commit
> titles itself.
>

Yes, you saw that another mentee started this work but could not really
finish that (yet?), right?

This sounds like a good case.


> Other than that, there was also this particular case with non escaped
> quotes within the commit title.
> Like:
> commit 97a32539b956 ("proc: convert everything to "struct proc_ops"")
> Should this be handled as well. Or is this a human error? I am not quite
> sure.
>

Of course, a commit title can contain quotes itself, but checkpatch does
not handle that case properly; this case can be quite tricky to handle. Let
us fix the other cases first and then see with an evaluation how often this
remaining case really happens.

Another case of another non-standard commit reference is that when I refer
to a commit with a broken title that still contains "[PATCH] xyz: do
something" in the git history, I simply refer to it only with commit
abcdabcdabcd ("xyz: do something") and I drop the [PATCH] prefix.

That is a non-standard way but I think it should be accepted as standard or
at least acceptable to checkpatch. Again, that also needs some discussion
with more kernel developers.

Lukas


> Thanks,
> Dwaipayan.
>

--00000000000012bacf05b3c5d785
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div><br><div class=3D"gmail_quote"><div di=
r=3D"auto">On Di., 10. Nov. 2020 at 19:41, Dwaipayan Ray &lt;<a href=3D"mai=
lto:dwaipayanray1@gmail.com" target=3D"_blank">dwaipayanray1@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
I was looking into GIT_COMMIT_ID warnings for checkpatch<br>
and certainly there are false positives which needs to be fixed<br>
as also said by a previous discussion.<br>
<br>
But before fixing it, I would like your comments on what should<br>
be fixed and what shouldn&#39;t considering the added code can<br>
be complex.<br>
<br>
The data below is an evaluation of about 50k commits from v5.4.<br>
<br>
$ cat checkpatch_out_50k.txt | grep -A3 &quot;GIT_COMMIT_ID&quot; \<br>
=C2=A0 =C2=A0| grep &quot;References&quot; | wc -l<br>
45</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
First of all there are 45 warnings of type:<br>
References: 2248a28384fe (&quot;drm/i915/gen8+: Add RC6 CTX corruption WA&q=
uot;)<br>
References: 860afa086841 (&quot;drm/i915/gt: Flush gen7 even harder&quot;),=
 etc.<br>
<br>
Should references be simply exempt from this check? I don&#39;t<br>
know much about it. But seems checkpatch is incorrect here.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I understand wha=
t the authors intend to do. They want to refer to a commit as a tag, such a=
s Link: for URLs or Fixes: for commits that fixed another commit. However, =
this format of using References: is not an agreed and common convention.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">We could ask on the mailin=
g list if there is some preference for such a common agreement. Then, we ca=
n extend the kernel process documentation and add a rule for checking this =
convention in checkpatch.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Do you want to do that? Expect some heavy discussion and some bikesheddin=
g.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
For other messages,<br>
$ cat checkpatch_out_50k.txt | grep -A3 &quot;GIT_COMMIT_ID&quot;=C2=A0 | \=
<br>
=C2=A0 grep -v &quot;GIT_COMMIT_ID&quot; |=C2=A0 =C2=A0 =C2=A0grep -P &quot=
;^\s*[a-z0-9]{12,}&quot; | wc -l<br>
468<br>
<br>
There were 468 missing &quot;commit&quot; word before the GIT SHA. Some<br>
of these were due to split lines. I think that could be fixed with some<br>
effort.<br>
<br>
And finally the other fixable warning is for those with split commit<br>
titles itself.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, you saw tha=
t another mentee started this work but could not really finish that (yet?),=
 right?</div><div dir=3D"auto"><br></div><div>This sounds like a good case.=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Other than that, there was also this particular case with non escaped<br>
quotes within the commit title.<br>
Like:<br>
commit 97a32539b956 (&quot;proc: convert everything to &quot;struct proc_op=
s&quot;&quot;)<br>
Should this be handled as well. Or is this a human error? I am not quite<br=
>
sure.<br>
</blockquote><div dir=3D"auto"><br></div><div>Of course, a commit title can=
 contain quotes itself, but checkpatch does not handle that case properly; =
this case can be quite tricky to handle. Let us fix the other cases first a=
nd then see with an evaluation how often this remaining case really happens=
.</div><div><br></div><div>Another case of another non-standard commit refe=
rence is that when I refer to a commit with a broken title that still conta=
ins &quot;[PATCH] xyz: do something&quot; in the git history, I simply refe=
r to it only with commit abcdabcdabcd (&quot;xyz: do something&quot;) and I=
 drop the [PATCH] prefix.</div><div><br></div><div>That is a non-standard w=
ay but I think it should be accepted as standard or at least acceptable to =
checkpatch. Again, that also needs some discussion with more kernel develop=
ers.</div><div><br></div><div>Lukas</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
Thanks,<br>
Dwaipayan.<br>
</blockquote></div></div>
</div>

--00000000000012bacf05b3c5d785--

--===============4279540516782829378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4279540516782829378==--
