Return-Path: <SRS0=//YW=BW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBA0C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 11:42:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92536207DA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 11:42:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LS6vuvBz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92536207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5F23A85FC9;
	Wed, 12 Aug 2020 11:42:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rsVYRDuLoXwb; Wed, 12 Aug 2020 11:42:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E17FE85A82;
	Wed, 12 Aug 2020 11:42:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6519C07FF;
	Wed, 12 Aug 2020 11:42:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EEF86C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 11:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EBBBF87942
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 11:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0SDFgHhFA6u1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 11:42:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 192A3877B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 11:42:26 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id t14so1624500wmi.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 04:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C0QJHCCDLxp0HshSqS2PYsQhdcu/ZwGpLx2gOZFU9mQ=;
 b=LS6vuvBzb9MruSo/tl/p5URuiF8AO6EgEHfjuhQXRnGxXSyJ/Ou+Mc+xvlQzohSqV0
 TccZ7VXGWjx78gaiHxBNXifVWABLxWQP7fgQs5jxLjAzJE6pGNHwA/M4p2LmHm0DeKDt
 AjjsDZipo9tb9sMDjH/2e90RVpXYlKxPfb+AWywsORiu4/5bXF41OMIgvwYFQNdvZVYF
 K49jrSvutkMLRnu9W1sLE+6JKp2K6kk2qylHxxl3qR2DiqpK66XiZHsV1ixLiomqK3IR
 Dbj+YuA2L5SRhGpBIFTTvmEc7SlBx/o+KS1EgwTvrV9V9OAzzR3GiFwQC3emEsxsmgWU
 7VeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C0QJHCCDLxp0HshSqS2PYsQhdcu/ZwGpLx2gOZFU9mQ=;
 b=YeX+MHkIQjaS2yhpnsaD75SD8Gg2LqCN+NWBkJGGF46SmvLXxqlOjHrCFs7KxlMlwG
 oUANS8zkXoH8SPm72IYrIQoWIGM6GfMYrDIXL+vYXu6IbLw3Fp5buf1QQ2VO1yFSqPFy
 TUQ6W4P0uhDtCTDZj4mpBZBuBfiuIos3aQTXISZPfYrtHvWFL1kBEgvIz/fh4yiqk72d
 PZ2r1e1O73X6atd1ANq1DsIxMeF6kyW96L3wpbzYRm01IW4++whHIwjA5H94T1ecPqal
 tLzpfn5dM1udAY9GMOafiznzNqEo7mMrzAyNHUT+Z9AH3r5UpCen7cDSzu5XzhnFrGdK
 exNA==
X-Gm-Message-State: AOAM532FN90S4aulySHxf716ZSEIdH9MfjkUiVxLGC2HZOkKsgcuvn9g
 lAXI5aOVumuMy4UicFEW5tSFQ4yUHUoPvcuVm5U=
X-Google-Smtp-Source: ABdhPJxVufo8mW4BBKk/h6t40DRjJxK27SLayv1VMoDXIzyk8rAzAOjq9swKGRGCJk3hWtzfXlMxgpNfMlYgepmekQI=
X-Received: by 2002:a1c:6557:: with SMTP id z84mr7812025wmb.19.1597232544660; 
 Wed, 12 Aug 2020 04:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200812065556.869508-1-yepeilin.cs@gmail.com>
 <20200812070827.GA1304640@kroah.com> <20200812071306.GA869606@PWN>
 <20200812085904.GA16441@kadam>
In-Reply-To: <20200812085904.GA16441@kadam>
From: Big Budsupply <bigbudsupply1@gmail.com>
Date: Wed, 12 Aug 2020 12:42:13 +0100
Message-ID: <CAHwJNhOMUJO2nMMqmfLXJt1ki-3fFbEW=K4h_KEpCobe8r_+iQ@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] hfs,
 hfsplus: Fix NULL pointer dereference in hfs_find_init()
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
Content-Type: multipart/mixed; boundary="===============8687198901138145876=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8687198901138145876==
Content-Type: multipart/alternative; boundary="00000000000072c16505acacae6c"

--00000000000072c16505acacae6c
Content-Type: text/plain; charset="UTF-8"

Hello guys hope you are doing good! we are Bigbudsupply we grow and sell
the best medical marijuana product, we are looking for long time customers,
you can Email us /Bigbudsupply1@gmail.com
Text/+14432672189
Looking forward to working with you guys

On Wed, 12 Aug 2020 at 09:59 Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Yeah, the patch doesn't work at all.  I looked at one call tree and it
>
> is:
>
>
>
> hfs_mdb_get() tries to allocate HFS_SB(sb)->ext_tree.
>
>
>
>         HFS_SB(sb)->ext_tree = hfs_btree_open(sb, HFS_EXT_CNID,
> hfs_ext_keycmp);
>
>                     ^^^^^^^^
>
>
>
> hfs_btree_open() calls page = read_mapping_page(mapping, 0, NULL);
>
> read_mapping_page() calls mapping->a_ops->readpage() which leads to
>
> hfs_readpage() which leads to hfs_ext_read_extent() which calls
>
> res = hfs_find_init(HFS_SB(inode->i_sb)->ext_tree, &fd);
>
>                                          ^^^^^^^^
>
>
>
> So we need ->ext_tree to be non-NULL before we can set ->ext_tree to be
>
> non-NULL...  :/
>
>
>
> I wonder how long this has been broken and if we should just delete the
>
> AFS file system.
>
>
>
> regards,
>
> dan carpenter
>
>
>
> --
>
> You received this message because you are subscribed to the Google Groups
> "syzkaller-bugs" group.
>
> To unsubscribe from this group and stop receiving emails from it, send an
> email to syzkaller-bugs+unsubscribe@googlegroups.com.
>
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/syzkaller-bugs/20200812085904.GA16441%40kadam
> .
>
>

--00000000000072c16505acacae6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto" style=3D"font-size:1rem;color:rgb(49,49,49);word-spa=
cing:1px">Hello guys hope you are doing good! we are Bigbudsupply we grow a=
nd sell the best medical marijuana product, we are looking for long time cu=
stomers, you can Email us /<a href=3D"mailto:Bigbudsupply1@gmail.com">Bigbu=
dsupply1@gmail.com</a></div><div dir=3D"auto" style=3D"font-size:1rem;color=
:rgb(49,49,49);word-spacing:1px">Text/+14432672189</div><div dir=3D"auto" s=
tyle=3D"font-size:1rem;color:rgb(49,49,49);word-spacing:1px">Looking forwar=
d to working with you guys</div><div dir=3D"auto" style=3D"font-size:1rem;c=
olor:rgb(49,49,49);word-spacing:1px"><br></div><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, 12 Aug 2020 at 09:59 Dan Carpe=
nter &lt;<a href=3D"mailto:dan.carpenter@oracle.com">dan.carpenter@oracle.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Yeah, the patch d=
oesn&#39;t work at all.=C2=A0 I looked at one call tree and it<br><br>is:<b=
r><br><br><br>hfs_mdb_get() tries to allocate HFS_SB(sb)-&gt;ext_tree.<br><=
br><br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 HFS_SB(sb)-&gt;ext_tree =3D hfs_btre=
e_open(sb, HFS_EXT_CNID, hfs_ext_keycmp);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^<br><br><br><br>hfs_b=
tree_open() calls page =3D read_mapping_page(mapping, 0, NULL);<br><br>read=
_mapping_page() calls mapping-&gt;a_ops-&gt;readpage() which leads to<br><b=
r>hfs_readpage() which leads to hfs_ext_read_extent() which calls<br><br>re=
s =3D hfs_find_init(HFS_SB(inode-&gt;i_sb)-&gt;ext_tree, &amp;fd);<br><br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^=
^^^^^^<br><br><br><br>So we need -&gt;ext_tree to be non-NULL before we can=
 set -&gt;ext_tree to be<br><br>non-NULL...=C2=A0 :/<br><br><br><br>I wonde=
r how long this has been broken and if we should just delete the<br><br>AFS=
 file system.<br><br><br><br>regards,<br><br>dan carpenter<br><br><br><br>-=
- <br><br>You received this message because you are subscribed to the Googl=
e Groups &quot;syzkaller-bugs&quot; group.<br><br>To unsubscribe from this =
group and stop receiving emails from it, send an email to <a href=3D"mailto=
:syzkaller-bugs%2Bunsubscribe@googlegroups.com" target=3D"_blank">syzkaller=
-bugs+unsubscribe@googlegroups.com</a>.<br><br>To view this discussion on t=
he web visit <a href=3D"https://groups.google.com/d/msgid/syzkaller-bugs/20=
200812085904.GA16441%40kadam" rel=3D"noreferrer" target=3D"_blank">https://=
groups.google.com/d/msgid/syzkaller-bugs/20200812085904.GA16441%40kadam</a>=
.<br><br></blockquote></div></div>

--00000000000072c16505acacae6c--

--===============8687198901138145876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8687198901138145876==--
