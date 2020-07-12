Return-Path: <SRS0=cUZQ=AX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F16C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 12 Jul 2020 12:20:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4234E206E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 12 Jul 2020 12:20:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtEqHcMV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4234E206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B17C987381;
	Sun, 12 Jul 2020 12:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4AnumOBuxjbk; Sun, 12 Jul 2020 12:20:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2969087374;
	Sun, 12 Jul 2020 12:20:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13C5FC0894;
	Sun, 12 Jul 2020 12:20:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9798AC0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 12:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 863B488809
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 12:20:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7i7iaWuonoZo
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 12:20:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A483B8879B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 12:20:05 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k27so4788033pgm.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 05:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hos9kEnMFThH6U+cf2BPQrTyFMdppV9ezbRJU8PB+wQ=;
 b=MtEqHcMV5EelvSU6sakwlKrnRfstM1e0B9bTzvYfNg+bNZmygvtn+vycGTg6Xf8jPs
 nD6riJaEfcni9Q58FJr3YmrRGy92JiZy2EbDhLoyEChlEvQ7pbg0GcbCHJl8q6pFmQ7T
 pyNdBZwWHphgfGKQIUzJa3sIoOe/E7hXNiizrye3DtXSu3A77E5SW5HBHdoIM8DQ483Z
 5aatruz2TLHSdPZnNSzilZzSvndXaY+M8k2sQg+wHfXEK/Sx3qh4KYK+dpmeAOJoSaW6
 3o2FQ6jq6679PPLriuckjJhST50PIhtYuifhTAPTNJd4EUk2MdXdxsUXKzRxkI6LCd8v
 q3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hos9kEnMFThH6U+cf2BPQrTyFMdppV9ezbRJU8PB+wQ=;
 b=poeH2b8/0idbG12TJnTQ/ouNLbPHcpzYZb1+QwlGK9c/JrUfmyVUuCLYM8DEl7IIcp
 wpD4+HCZDkvzhfoHiOU041ReRsvULxuCZf8u6mZD9hrJVgZQx6cu7H/6tlAXNV/sBtO9
 ROXM5R8TzivA95/EfgNNc2YRpYtn6QoUTdKIx+swKvd90FYk5Fg2Et1nOO7I0WrAx1cs
 Z04w9PJ9Dn8gXkMl4cR88JoZSi1tzZHrGpFHe4RqcRslS3zZoXbbJqD/4dkZs4d+TCxA
 fvZoO/0eHbYgvyToAFZfrIjhPe1OEXslJ6rLyw6kOrOzJxu6fO74+htUwSclDLDh1FKv
 KUbg==
X-Gm-Message-State: AOAM530gm0tvVWB142svA4VMf657V5fUXA3en8GyMm2bYDWV9NjlTfAl
 deKebTxxDpOFHgaNhujlYWQ=
X-Google-Smtp-Source: ABdhPJwQW6hGbKW4WQr3gz6mS/Yf7ZJt9r0MIG64ReRya2eknpyAMYyfz+RsX59nNBtLqWZ8akOojw==
X-Received: by 2002:a65:428d:: with SMTP id j13mr66754572pgp.211.1594556405023; 
 Sun, 12 Jul 2020 05:20:05 -0700 (PDT)
Received: from localhost ([2401:4900:1692:3ec9:be31:e9c3:70d0:18a])
 by smtp.gmail.com with ESMTPSA id c23sm11545605pfo.32.2020.07.12.05.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 05:20:04 -0700 (PDT)
Date: Sun, 12 Jul 2020 17:49:56 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Message-ID: <20200712121956.3hspxlqh4oawm5pc@mrinalpandey>
References: <20200711154415.34w6ndu24uodj3ba@mrinalpandey>
 <CAKXUXMwE+23QnzLyNegXmSSdUeXC8Wv8ZzrBke7KON35kRqfqg@mail.gmail.com>
 <CAD1=X6kLBAAMqMH+bZipagmVq4XHx4LOVB=yUb1J870NgXMCUg@mail.gmail.com>
 <CAKXUXMzXiHCk9bJYK84WhL7FKRqV7YKmQ8_EJZgU_wTjiui8Tg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKXUXMzXiHCk9bJYK84WhL7FKRqV7YKmQ8_EJZgU_wTjiui8Tg@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix the usage of
	capture group ( ... )
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
Content-Type: multipart/mixed; boundary="===============4825341038928659143=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============4825341038928659143==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bdlhd3cbjzcbco4g"
Content-Disposition: inline


--bdlhd3cbjzcbco4g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20/07/12 09:18AM, Lukas Bulwahn wrote:
> On Sun, Jul 12, 2020 at 7:18 AM Mrinal Pandey <mrinalmni@gmail.com> wrote:
>=20
> > On Sun, Jul 12, 2020 at 12:44 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > wrote:
> >
> >>
> >>
> >> On Sat, Jul 11, 2020 at 5:44 PM Mrinal Pandey <mrinalmni@gmail.com>
> >> wrote:
> >>
> >>> The usage of "capture group (...)" in the immediate condition after `=
&&`
> >>> results in `$1` being uninitialized. This eventually crashes the scri=
pt.
> >>>
> >>>
> >> It does not really crash it, right? It just emits a warning.
> >>
> >
> > Sir,
> >
> > Yes. I will modify the line accordingly.
> >
> >>
> >>
> >>> Fix this by placing the capture group in the condition before `&&`.
> >>> Thus, `$1` can be initialized to the text it matches thereby setting =
it
> >>> to the desired and required value.
> >>>
> >>>
> >> Maybe you can look when this bug was introduced?
> >>
> >
> > The bug was first introduced with the commit `e518e9a59ec3` when the bl=
ock
> > was
> > added to the script. It has been like that since then.
> > Should I add this detail too in the commit message?
> >
>=20
> Yes, please do.
>=20
> Commits are referred to with its hash shortened to 12 characters and the
> commit message header in the following format:
>=20
> Commit e518e9a59ec3 ("checkpatch: emit an error when there's a diff in a
> changelog")
>=20
>=20
> Further note:
> - can you also explain what the author intended to do?
> - can you describe in one sentence how you discovered this bug?
> - use checkpatch.pl on your own patch.
>=20
> Please rework the commit message and resend to this list, Shuah and me.
>=20
> I think if that patch is then okay, we have a quick look and then you can
> send it out to the general list.
>
Sir,

Please let me know if the commit message could be further improved or
this is what you seek.
I ran my patch through checkpatch and it says that the patch has no
obvious style problems.
I hope I wasn't supposed to include patch version history on this patch,
please correct me if I am wrong.

Thank you.
>=20
> Lukas
>=20
> >

The usage of "capture group (...)" in the immediate condition after `&&`
results in `$1` being uninitialized. This issues a warning "Use of
uninitialized value $1 in regexp compilation at ./scripts/checkpatch.pl
line 2638".

I noticed this bug while running checkpatch on the set of commits from
v5.7 to v5.8-rc1 of the kernel. The warning was thrown on the commits
which had a diff content in their commit message.

This bug was introduced in the script by Commit e518e9a59ec3
("checkpatch: emit an error when there's a diff in a changelog"). It has
been in the script since then.

The author intended to store the match made by capture group in variable
`$1`. This should have contained the name of the file as `[\w/]+` matched.
However, this couldn't be accomplished due to usage of capture group and
`$1` in the same RegEx.

Fix this by placing the capture group in the condition before `&&`.
Thus, `$1` can be initialized to the text which capture group matches
thereby setting it to the desired and required value.

Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4c820607540b..e73e998d582a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2636,8 +2636,8 @@ sub process {
=20
 # Check if the commit log has what seems like a diff which can confuse pat=
ch
 		if ($in_commit_log && !$commit_log_has_diff &&
-		    (($line =3D~ m@^\s+diff\b.*a/[\w/]+@ &&
-		      $line =3D~ m@^\s+diff\b.*a/([\w/]+)\s+b/$1\b@) ||
+		    (($line =3D~ m@^\s+diff\b.*a/([\w/]+)@ &&
+		      $line =3D~ m@^\s+diff\b.*a/[\w/]+\s+b/$1\b@) ||
 		     $line =3D~ m@^\s*(?:\-\-\-\s+a/|\+\+\+\s+b/)@ ||
 		     $line =3D~ m/^\s*\@\@ \-\d+,\d+ \+\d+,\d+ \@\@/)) {
 			ERROR("DIFF_IN_COMMIT_MSG",
--=20
2.25.1


--bdlhd3cbjzcbco4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8K/+QACgkQxIwpEWwx
hGS3Yg//SbfIwXyCqpCk/qTSKyGy4BO2SzzUIeHMVl/zM/w2+5Rd82+zwcZAMFWL
6Z/ESEEDYLRqsGaEPnpCPt/SayGPBGTt8WwTCe3z52bJBlLFyrEjUG5e3D/UzrSj
joZw+tU41cXxIaEQztsjuQJeglZ5SikUb34VYa1rZSj7lJOVr3lvhCh+6JPxlxr+
U552LzRQiw6u064nE+nDCYS7BBtgYD4nqZfNMlCvua94bxm3EQF4QIqhkctQoaj3
iX55cav9N7eerYdSTOqyt6uV/0vRq40oJfdxYf8NqZmMiqGoYffw3e+h20G7kgQK
6YaM89J0ZB9hFAyVokM8QvXdleOpHGMnJUlrLIxxY61zvcjEJWsG+InBJxJg8xRI
ApOiNg7QxjuLH+l1ZwmRz0jHdnaaMhkxwXAZeSvu/F1JxhTSUibBU2jSep8vpjuy
lkVoSwTIzmY15EJlOMdzG0pF60mAi3E9ADgfPoP04L/bVSF6qSgZcCThjjXo0BKi
yC0MiVoI2sAfwIHEjQjkvPpGbESPnXaU32XDILSCQMzc9T4F6eTwvNd/Fd3mI5MF
QnQHCiww68TUwhB2cYe2GHMBSiNC+nNSm7Lx0YOYTSIHhQ8ggCxApqk7jCikk4g/
SXRPrhcTSqC5TrckZtPdimcHEJBfj3wutCPdfHvTH9+ci3q5fM4=
=b66T
-----END PGP SIGNATURE-----

--bdlhd3cbjzcbco4g--

--===============4825341038928659143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4825341038928659143==--
