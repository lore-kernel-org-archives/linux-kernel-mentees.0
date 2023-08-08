Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33A2C001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Aug 2023 15:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CCEB8201E;
	Tue,  8 Aug 2023 15:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CCEB8201E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NOtnBluR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RxFR3nmzyhI0; Tue,  8 Aug 2023 15:15:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0B85B8200F;
	Tue,  8 Aug 2023 15:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B85B8200F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DEE08C0071;
	Tue,  8 Aug 2023 15:15:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEF19C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 15:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C1B16111D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 15:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C1B16111D
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=NOtnBluR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qd_qD4VbXyrO
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 15:15:15 +0000 (UTC)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7472F60D80
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 15:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7472F60D80
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6b9a2416b1cso4930764a34.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Aug 2023 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691507714; x=1692112514;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IzwS7XDx7/B5za3o6W/irX9iOCNwkqxYx+kcCM0I0vE=;
 b=NOtnBluRcNvVM0r/UvNS7d+235uj0B46wfUh6MEXHMsp4qEbtKhkN4OV9N7tkAmWcP
 5awyWEe7JHfW9lSMoMvPVfQyQpqndf2dtEuBb5fatuvfZz7R2Mq6ikx5uVMex0wjFd0Y
 Nj9ZdgfIbIGZkZTI/B/BSNFo+JTv/pGL9skQSX27Uwkbst7IciYqYoWMArNtEn8cR2Lb
 NPXgMaGb2Q3RWujZ8BFQyyZYDfMbBLC+imtAgasjyHpi1EhsVqk/lC211gQMz9R4ezr1
 YUARKU/Y7CawtegSp8W4+eGSObMEFi+pG21BsMQa72RvnxuT9v02GG0wC3Rz68mvmQWR
 iMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691507714; x=1692112514;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IzwS7XDx7/B5za3o6W/irX9iOCNwkqxYx+kcCM0I0vE=;
 b=AfIQ4a4+nEMcpznQYOGuHOd03XjSO5X2SMHrOY/NhDx0R+XDagHq4mqhD4mScfj8JQ
 F5fribtDfNZ4YTk1G+oEC8Ug7sGM06xVqdZjR7BofRdK3GxWUyPRod0G51SNMKrEH7iA
 BoOyGSOzKmLgqaguk9pYQgj+2YgHArn0I+F32D06OhN9CA6qMuzK+ywEjt24HIJ3gIaZ
 cxFTAfA0T40gc3XerpsNRMHlfBehtvz2sZr7xUmhmwE3HYBtXXAM1tSrp2bpKFIonRmT
 7IGp8TWylrvciGkdN+f9dEVoK0ARe8re/lpGSWCWeG+twi5ZOYGdJcV/XFetClUbELIE
 EtBA==
X-Gm-Message-State: AOJu0YwOLtS//x8swFTzSka8GBYakv6qmBu5z62qnS+s3fDpHoEfMtls
 H74G5hmpX7LjhmIVk8ZXrQleZJgXQtPUDVenK8c=
X-Google-Smtp-Source: AGHT+IEZOBIb1FIJMiKMGmnQ/IWmohUoLmdX7FpJYsOBzB7rmAFKHB5uZLLsrxDpYDT/x82ES+VIbp87nVJvNrk0eqw=
X-Received: by 2002:a05:6830:32a7:b0:6b9:58dc:a2d9 with SMTP id
 m39-20020a05683032a700b006b958dca2d9mr11320195ott.28.1691507714277; Tue, 08
 Aug 2023 08:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <2023080821-blandness-survival-44af@gregkh>
 <20230808102958.8161-1-ghandatmanas@gmail.com>
 <2023080833-pedicure-flavorful-921c@gregkh>
In-Reply-To: <2023080833-pedicure-flavorful-921c@gregkh>
From: Manas Ghandat <ghandatmanas@gmail.com>
Date: Tue, 8 Aug 2023 20:45:02 +0530
Message-ID: <CAEt2hJ5icep5dF_OhuZwe0zig4VKCTKuQ0=iYfpOek7Ebp12Lw@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs : fix shift-out-of-bounds in ntfs_iget
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Linux-kernel-mentees@lists.linuxfoundation.org,
 linkinjeon@kernel.org, anton@tuxera.com
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
Content-Type: multipart/mixed; boundary="===============2220632703331154855=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2220632703331154855==
Content-Type: multipart/alternative; boundary="00000000000071c4dd06026ad400"

--00000000000071c4dd06026ad400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In the above patch I have mentioned what are the changes from the version
1. Also since most of the lines of the patch were a change due to some
indentation error, the whole patch appears as the diff.

On Tue, Aug 8, 2023 at 4:15=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:

> On Tue, Aug 08, 2023 at 03:59:58PM +0530, Manas Ghandat wrote:
> > Added a check to the compression_unit so that out of bound doesn't occu=
r.
> >
> > Fix patching issues in version 2.
> >
> > Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
> > Reported-by: syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D4768a8f039aa677897d0
> > ---
> >  fs/ntfs/inode.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> > index 6c3f38d66579..a657322874ed 100644
> > --- a/fs/ntfs/inode.c
> > +++ b/fs/ntfs/inode.c
> > @@ -1077,6 +1077,15 @@ static int ntfs_read_locked_inode(struct inode
> *vi)
> >                                       goto unm_err_out;
> >                               }
> >                               if (a->data.non_resident.compression_unit=
)
> {
> > +                                     if
> (a->data.non_resident.compression_unit +
> > +                                             vol->cluster_size_bits >
> 32) {
> > +                                             ntfs_error(vi->i_sb,
> > +                                                     "Found
> non-standard compression unit (%u).   Cannot handle this.",
> > +
>  a->data.non_resident.compression_unit
> > +                                             );
> > +                                             err =3D -EOPNOTSUPP;
> > +                                             goto unm_err_out;
> > +                                     }
> >                                       ni->itype.compressed.block_size =
=3D
> 1U <<
> >
>  (a->data.non_resident.
> >                                                       compression_unit =
+
> > --
> > 2.37.2
> >
>
> Hi,
>
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
>
> You are receiving this message because of the following common error(s)
> as indicated below:
>
> - This looks like a new version of a previously submitted patch, but you
>   did not list below the --- line any changes from the previous version.
>   Please read the section entitled "The canonical patch format" in the
>   kernel file, Documentation/process/submitting-patches.rst for what
>   needs to be done here to properly describe this.
>
>
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
>
> thanks,
>
> greg k-h's patch email bot
>

--00000000000071c4dd06026ad400
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In the above patch I have mentioned what are the changes f=
rom the version 1. Also since most of the lines of the patch were a change =
due to some indentation error, the whole patch appears as the diff.</div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, =
Aug 8, 2023 at 4:15=E2=80=AFPM Greg KH &lt;<a href=3D"mailto:gregkh@linuxfo=
undation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Tue, Aug 08, 2023 at 03:59:58PM =
+0530, Manas Ghandat wrote:<br>
&gt; Added a check to the compression_unit so that out of bound doesn&#39;t=
 occur.<br>
&gt; <br>
&gt; Fix patching issues in version 2.<br>
&gt; <br>
&gt; Signed-off-by: Manas Ghandat &lt;<a href=3D"mailto:ghandatmanas@gmail.=
com" target=3D"_blank">ghandatmanas@gmail.com</a>&gt;<br>
&gt; Reported-by: <a href=3D"mailto:syzbot%2B4768a8f039aa677897d0@syzkaller=
.appspotmail.com" target=3D"_blank">syzbot+4768a8f039aa677897d0@syzkaller.a=
ppspotmail.com</a><br>
&gt; Closes: <a href=3D"https://syzkaller.appspot.com/bug?extid=3D4768a8f03=
9aa677897d0" rel=3D"noreferrer" target=3D"_blank">https://syzkaller.appspot=
.com/bug?extid=3D4768a8f039aa677897d0</a><br>
&gt; ---<br>
&gt;=C2=A0 fs/ntfs/inode.c | 9 +++++++++<br>
&gt;=C2=A0 1 file changed, 9 insertions(+)<br>
&gt; <br>
&gt; diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c<br>
&gt; index 6c3f38d66579..a657322874ed 100644<br>
&gt; --- a/fs/ntfs/inode.c<br>
&gt; +++ b/fs/ntfs/inode.c<br>
&gt; @@ -1077,6 +1077,15 @@ static int ntfs_read_locked_inode(struct inode =
*vi)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto u=
nm_err_out;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (a-&gt;data.non_resident.compre=
ssion_unit) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (a-&gt;da=
ta.non_resident.compression_unit +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0vol-&gt;cluster_size_bits &gt; 32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ntfs_error(vi-&gt;i_sb,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Found non-standard compr=
ession unit (%u).=C2=A0 =C2=A0Cannot handle this.&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a-&gt;data.non_resident.compre=
ssion_unit<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0err =3D -EOPNOTSUPP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0goto unm_err_out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ni-&gt=
;itype.compressed.block_size =3D 1U &lt;&lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(a-&gt;data.non_residen=
t.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compression_unit +<br>
&gt; -- <br>
&gt; 2.37.2<br>
&gt; <br>
<br>
Hi,<br>
<br>
This is the friendly patch-bot of Greg Kroah-Hartman.=C2=A0 You have sent h=
im<br>
a patch that has triggered this response.=C2=A0 He used to manually respond=
<br>
to these common problems, but in order to save his sanity (he kept<br>
writing the same thing over and over, yet to different people), I was<br>
created.=C2=A0 Hopefully you will not take offence and will fix the problem=
<br>
in your patch and resubmit it so that it can be accepted into the Linux<br>
kernel tree.<br>
<br>
You are receiving this message because of the following common error(s)<br>
as indicated below:<br>
<br>
- This looks like a new version of a previously submitted patch, but you<br=
>
=C2=A0 did not list below the --- line any changes from the previous versio=
n.<br>
=C2=A0 Please read the section entitled &quot;The canonical patch format&qu=
ot; in the<br>
=C2=A0 kernel file, Documentation/process/submitting-patches.rst for what<b=
r>
=C2=A0 needs to be done here to properly describe this.<br>
<br>
<br>
If you wish to discuss this problem further, or you have questions about<br=
>
how to resolve this issue, please feel free to respond to this email and<br=
>
Greg will reply once he has dug out from the pending patches received<br>
from other developers.<br>
<br>
thanks,<br>
<br>
greg k-h&#39;s patch email bot<br>
</blockquote></div>

--00000000000071c4dd06026ad400--

--===============2220632703331154855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2220632703331154855==--
