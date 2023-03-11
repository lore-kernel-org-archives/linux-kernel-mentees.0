Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D65C6FD1C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Mar 2023 17:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3477418B7;
	Sat, 11 Mar 2023 17:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3477418B7
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C6D5HWsf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NMIgiwM0POEr; Sat, 11 Mar 2023 17:28:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 269A34188B;
	Sat, 11 Mar 2023 17:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 269A34188B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11BC9C0071;
	Sat, 11 Mar 2023 17:28:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2768C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 17:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C1EE4188B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 17:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C1EE4188B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ecoRy7xU4MZS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 17:28:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E101441C01
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E101441C01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 17:28:23 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id h19so9166685qtk.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 09:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678555702;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fnRfrNBgW6VmdsH5V5foIRR4UqfDscL7jiZjugpsRTo=;
 b=C6D5HWsfgRAVuzMHhXeARyWuDjQgOKKer7Ufufgzt0noOOc52Q1n6+XRBM3TSoUWEJ
 XSzPNVsOekj4XArMD37y6hPza1Cg+tuPLXDg5ygK1OS1/k7R93nfruXDROk8aSIUIpry
 J8NIWsR1XLoaEm+/paZETVfzweT55acsl8Jz3jYuWCgzBWvHTaQpbsh9k7zpjEorh8to
 73siR+m+Dhc0VeUjQbX5KtL1PSjQKNgUPRcZACxq5O+BqVwoXem0pYBgf5GyB2CfFGJU
 1F9/CF0hVdoRYuAziPsUViPIpvg2Sbd+eWmEw5A+OTG/+sE2LyZkOD7ZSRCvAUEJ734a
 NOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678555702;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fnRfrNBgW6VmdsH5V5foIRR4UqfDscL7jiZjugpsRTo=;
 b=AjBDU3LTE6o8Y81PV0DtFVyssg5MPu0qRTo+0TnXT1zkgXQ9POdVVgNxHyXFPG4Sw3
 hSXJAx++1JfAXEQ55ny76QQOeiMj9ykKrRdmpmsZKLj57Iz0eUTch92OY0BFapD7LUou
 EYsLWsWSC6CfcKbgDRiq6LTpG8g1AYM+3em9GptBc+ACjvRsm+ghbUXkD0Cmxjbl89ld
 d1IKvHucANs8mdgq3PQZmssy3EPbOGwGmF71v7jjz9itugI9w5Sns7i9TZBs83kcdRfw
 hTEpLu47jUYtNTWQZlGPClmC4ixA+WBG569P2nXFRt5WzzkwCDfPQl9WnNI8SowKkAxE
 7Pzw==
X-Gm-Message-State: AO0yUKU2cKrJfTJXPpUQ5CAPlDtAoKGqcwUwE0kmkPfEgyDMcGyxt9kB
 ZJTmhkReBxUB4u4oQoGtVbv4uG662KAy92E2NQo=
X-Google-Smtp-Source: AK7set9MRPoWlhlXXNagYxf7CMlIQeQnU+M7fqxlruT+LftsaXnAPYZ8vyLAxDqRt4PSvOUSgVD2j6p38/nFosDJGuA=
X-Received: by 2002:ac8:4295:0:b0:3bf:e153:89d8 with SMTP id
 o21-20020ac84295000000b003bfe15389d8mr7536967qtl.0.1678555702618; Sat, 11 Mar
 2023 09:28:22 -0800 (PST)
MIME-Version: 1.0
References: <20230310202619.433269-1-ivan.orlov0322@gmail.com>
In-Reply-To: <20230310202619.433269-1-ivan.orlov0322@gmail.com>
From: David Kahurani <k.kahurani@gmail.com>
Date: Sat, 11 Mar 2023 20:28:11 +0300
Message-ID: <CAAZOf24yhpSBd1926v7T=qDwqvFfLsWMJeMKTafeZ=69hJ4rdw@mail.gmail.com>
Subject: Re: [PATCH] 9P FS: Fix wild-memory-access write in v9fs_get_acl
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: lucho@ionkov.net, ericvh@gmail.com, asmadeus@codewreck.org,
 linux_oss@crudebyte.com, linux-kernel@vger.kernel.org,
 syzbot+cb1d16facb3cc90de5fb@syzkaller.appspotmail.com,
 v9fs-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============2790160887876855102=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2790160887876855102==
Content-Type: multipart/alternative; boundary="00000000000063f11305f6a3349d"

--00000000000063f11305f6a3349d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 11:28=E2=80=AFPM Ivan Orlov <ivan.orlov0322@gmail.c=
om>
wrote:

> KASAN reported the following issue:
> [   36.825817][ T5923] BUG: KASAN: wild-memory-access in
> v9fs_get_acl+0x1a4/0x390
> [   36.827479][ T5923] Write of size 4 at addr 9fffeb37f97f1c00 by task
> syz-executor798/5923
> [   36.829303][ T5923]
> [   36.829846][ T5923] CPU: 0 PID: 5923 Comm: syz-executor798 Not tainted
> 6.2.0-syzkaller-18302-g596b6b709632 #0
> [   36.832110][ T5923] Hardware name: Google Google Compute Engine/Google
> Compute Engine, BIOS Google 01/21/2023
> [   36.834464][ T5923] Call trace:
> [   36.835196][ T5923]  dump_backtrace+0x1c8/0x1f4
> [   36.836229][ T5923]  show_stack+0x2c/0x3c
> [   36.837100][ T5923]  dump_stack_lvl+0xd0/0x124
> [   36.838103][ T5923]  print_report+0xe4/0x4c0
> [   36.839068][ T5923]  kasan_report+0xd4/0x130
> [   36.840052][ T5923]  kasan_check_range+0x264/0x2a4
> [   36.841199][ T5923]  __kasan_check_write+0x2c/0x3c
> [   36.842216][ T5923]  v9fs_get_acl+0x1a4/0x390
> [   36.843232][ T5923]  v9fs_mount+0x77c/0xa5c
> [   36.844163][ T5923]  legacy_get_tree+0xd4/0x16c
> [   36.845173][ T5923]  vfs_get_tree+0x90/0x274
> [   36.846137][ T5923]  do_new_mount+0x25c/0x8c8
> [   36.847066][ T5923]  path_mount+0x590/0xe58
> [   36.848147][ T5923]  __arm64_sys_mount+0x45c/0x594
> [   36.849273][ T5923]  invoke_syscall+0x98/0x2c0
> [   36.850421][ T5923]  el0_svc_common+0x138/0x258
> [   36.851397][ T5923]  do_el0_svc+0x64/0x198
> [   36.852398][ T5923]  el0_svc+0x58/0x168
> [   36.853224][ T5923]  el0t_64_sync_handler+0x84/0xf0
> [   36.854293][ T5923]  el0t_64_sync+0x190/0x194
>
> Calling '__v9fs_get_acl' method in 'v9fs_get_acl' creates the
> following chain of function calls:
>
> __v9fs_get_acl
>         v9fs_fid_get_acl
>                 v9fs_fid_xattr_get
>                         p9_client_xattrwalk
>
> Function p9_client_xattrwalk accepts a pointer to u64-typed
> variable attr_size and puts some u64 value into it. However,
> after the executing the p9_client_xattrwalk, in some circumstances
> we assign the value of u64-typed variable 'attr_size' to the
> variable 'retval', which we will return. However, the type of
> 'retval' is ssize_t, and if the value of attr_size is larger
> than SSIZE_MAX, we will face the signed type overflow. If the
> overflow occurs, the result of v9fs_fid_xattr_get may be
> negative, but not classified as an error. When we try to allocate
> an acl with 'broken' size we receive an error, but don't process
> it. When we try to free this acl, we face the 'wild-memory-access'
> error (because it wasn't allocated).
>
> This patch will modify the condition in the 'v9fs_fid_xattr_get'
> function, so it will return an error if the 'attr_size' is larger
> than SSIZE_MAX.
>
> Reported-by: syzbot+cb1d16facb3cc90de5fb@syzkaller.appspotmail.com
> Link:
> https://syzkaller.appspot.com/bug?id=3Dfbbef66d9e4d096242f3617de5d14d1270=
5b4659
> Signed-off-by
> <https://syzkaller.appspot.com/bug?id=3Dfbbef66d9e4d096242f3617de5d14d127=
05b4659Signed-off-by>:
> Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
>  fs/9p/xattr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/9p/xattr.c b/fs/9p/xattr.c
> index 50f7f3f6b55e..d6f7450107a8 100644
> --- a/fs/9p/xattr.c
> +++ b/fs/9p/xattr.c
> @@ -35,7 +35,7 @@ ssize_t v9fs_fid_xattr_get(struct p9_fid *fid, const
> char *name,
>                 return retval;
>         }
>         if (attr_size > buffer_size) {
> -               if (!buffer_size) /* request to get the attr_size */
> +               if (!buffer_size && attr_size <=3D (u64) SSIZE_MAX) /*
> request to get the attr_size */
>

I'm not sure what are the rules around here but I prefer to use brackets
more generously.


>                         retval =3D attr_size;
>                 else
>                         retval =3D -ERANGE;
> --
> 2.34.1
>
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
>

--00000000000063f11305f6a3349d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 10, 2023 at 11:28=E2=80=
=AFPM Ivan Orlov &lt;<a href=3D"mailto:ivan.orlov0322@gmail.com">ivan.orlov=
0322@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">KASAN reported the following issue:<br>
[=C2=A0 =C2=A036.825817][ T5923] BUG: KASAN: wild-memory-access in v9fs_get=
_acl+0x1a4/0x390<br>
[=C2=A0 =C2=A036.827479][ T5923] Write of size 4 at addr 9fffeb37f97f1c00 b=
y task syz-executor798/5923<br>
[=C2=A0 =C2=A036.829303][ T5923]<br>
[=C2=A0 =C2=A036.829846][ T5923] CPU: 0 PID: 5923 Comm: syz-executor798 Not=
 tainted 6.2.0-syzkaller-18302-g596b6b709632 #0<br>
[=C2=A0 =C2=A036.832110][ T5923] Hardware name: Google Google Compute Engin=
e/Google Compute Engine, BIOS Google 01/21/2023<br>
[=C2=A0 =C2=A036.834464][ T5923] Call trace:<br>
[=C2=A0 =C2=A036.835196][ T5923]=C2=A0 dump_backtrace+0x1c8/0x1f4<br>
[=C2=A0 =C2=A036.836229][ T5923]=C2=A0 show_stack+0x2c/0x3c<br>
[=C2=A0 =C2=A036.837100][ T5923]=C2=A0 dump_stack_lvl+0xd0/0x124<br>
[=C2=A0 =C2=A036.838103][ T5923]=C2=A0 print_report+0xe4/0x4c0<br>
[=C2=A0 =C2=A036.839068][ T5923]=C2=A0 kasan_report+0xd4/0x130<br>
[=C2=A0 =C2=A036.840052][ T5923]=C2=A0 kasan_check_range+0x264/0x2a4<br>
[=C2=A0 =C2=A036.841199][ T5923]=C2=A0 __kasan_check_write+0x2c/0x3c<br>
[=C2=A0 =C2=A036.842216][ T5923]=C2=A0 v9fs_get_acl+0x1a4/0x390<br>
[=C2=A0 =C2=A036.843232][ T5923]=C2=A0 v9fs_mount+0x77c/0xa5c<br>
[=C2=A0 =C2=A036.844163][ T5923]=C2=A0 legacy_get_tree+0xd4/0x16c<br>
[=C2=A0 =C2=A036.845173][ T5923]=C2=A0 vfs_get_tree+0x90/0x274<br>
[=C2=A0 =C2=A036.846137][ T5923]=C2=A0 do_new_mount+0x25c/0x8c8<br>
[=C2=A0 =C2=A036.847066][ T5923]=C2=A0 path_mount+0x590/0xe58<br>
[=C2=A0 =C2=A036.848147][ T5923]=C2=A0 __arm64_sys_mount+0x45c/0x594<br>
[=C2=A0 =C2=A036.849273][ T5923]=C2=A0 invoke_syscall+0x98/0x2c0<br>
[=C2=A0 =C2=A036.850421][ T5923]=C2=A0 el0_svc_common+0x138/0x258<br>
[=C2=A0 =C2=A036.851397][ T5923]=C2=A0 do_el0_svc+0x64/0x198<br>
[=C2=A0 =C2=A036.852398][ T5923]=C2=A0 el0_svc+0x58/0x168<br>
[=C2=A0 =C2=A036.853224][ T5923]=C2=A0 el0t_64_sync_handler+0x84/0xf0<br>
[=C2=A0 =C2=A036.854293][ T5923]=C2=A0 el0t_64_sync+0x190/0x194<br>
<br>
Calling &#39;__v9fs_get_acl&#39; method in &#39;v9fs_get_acl&#39; creates t=
he<br>
following chain of function calls:<br>
<br>
__v9fs_get_acl<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 v9fs_fid_get_acl<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v9fs_fid_xattr_get<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 p9_client_xattrwalk<br>
<br>
Function p9_client_xattrwalk accepts a pointer to u64-typed<br>
variable attr_size and puts some u64 value into it. However,<br>
after the executing the p9_client_xattrwalk, in some circumstances<br>
we assign the value of u64-typed variable &#39;attr_size&#39; to the<br>
variable &#39;retval&#39;, which we will return. However, the type of<br>
&#39;retval&#39; is ssize_t, and if the value of attr_size is larger<br>
than SSIZE_MAX, we will face the signed type overflow. If the<br>
overflow occurs, the result of v9fs_fid_xattr_get may be<br>
negative, but not classified as an error. When we try to allocate<br>
an acl with &#39;broken&#39; size we receive an error, but don&#39;t proces=
s<br>
it. When we try to free this acl, we face the &#39;wild-memory-access&#39;<=
br>
error (because it wasn&#39;t allocated).<br>
<br>
This patch will modify the condition in the &#39;v9fs_fid_xattr_get&#39;<br=
>
function, so it will return an error if the &#39;attr_size&#39; is larger<b=
r>
than SSIZE_MAX.<br>
<br>
Reported-by: <a href=3D"mailto:syzbot%2Bcb1d16facb3cc90de5fb@syzkaller.apps=
potmail.com" target=3D"_blank">syzbot+cb1d16facb3cc90de5fb@syzkaller.appspo=
tmail.com</a><br>
Link: <a href=3D"https://syzkaller.appspot.com/bug?id=3Dfbbef66d9e4d096242f=
3617de5d14d12705b4659Signed-off-by" rel=3D"noreferrer" target=3D"_blank">ht=
tps://syzkaller.appspot.com/bug?id=3Dfbbef66d9e4d096242f3617de5d14d12705b46=
59<br>
Signed-off-by</a>: Ivan Orlov &lt;<a href=3D"mailto:ivan.orlov0322@gmail.co=
m" target=3D"_blank">ivan.orlov0322@gmail.com</a>&gt;<br>
---<br>
=C2=A0fs/9p/xattr.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/fs/9p/xattr.c b/fs/9p/xattr.c<br>
index 50f7f3f6b55e..d6f7450107a8 100644<br>
--- a/fs/9p/xattr.c<br>
+++ b/fs/9p/xattr.c<br>
@@ -35,7 +35,7 @@ ssize_t v9fs_fid_xattr_get(struct p9_fid *fid, const char=
 *name,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return retval;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (attr_size &gt; buffer_size) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!buffer_size) /=
* request to get the attr_size */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!buffer_size &a=
mp;&amp; attr_size &lt;=3D (u64) SSIZE_MAX) /* request to get the attr_size=
 */<br></blockquote><div><br></div><div>I&#39;m not sure what are the rules=
 around here but I prefer to use brackets more generously.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 retval =3D attr_size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 retval =3D -ERANGE;<br>
-- <br>
2.34.1<br>
<br>
_______________________________________________<br>
Linux-kernel-mentees mailing list<br>
<a href=3D"mailto:Linux-kernel-mentees@lists.linuxfoundation.org" target=3D=
"_blank">Linux-kernel-mentees@lists.linuxfoundation.org</a><br>
<a href=3D"https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-=
mentees" rel=3D"noreferrer" target=3D"_blank">https://lists.linuxfoundation=
.org/mailman/listinfo/linux-kernel-mentees</a><br>
</blockquote></div></div>

--00000000000063f11305f6a3349d--

--===============2790160887876855102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2790160887876855102==--
