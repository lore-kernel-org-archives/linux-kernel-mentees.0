Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FC2EE49A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Aug 2023 12:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B375F40A7F;
	Tue, 22 Aug 2023 12:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B375F40A7F
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=c/ag/nRW
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDbRrr8xASin; Tue, 22 Aug 2023 12:51:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CB8654014D;
	Tue, 22 Aug 2023 12:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB8654014D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A264CC0039;
	Tue, 22 Aug 2023 12:51:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24682C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 12:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F35BD4014D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 12:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F35BD4014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XehiS6IBcQSn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 12:51:51 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40550400D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 12:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40550400D9
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b962c226ceso69653981fa.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692708709; x=1693313509;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KcLgdDz4b1eBFUGSU1LTPb50x5JBw9cIhbPd6cA9LcM=;
 b=c/ag/nRWdqJmp8bL+o+PX8aJ9dCXeE5P4yPrKqP+f2BTS2aHf2vwCsEIQ+yQ+U7bYN
 mGZK9w8sIv6p9tM5winOpdpI8qUEe7Txb5MMNtIYr60bmOX/qw+W6ZMSsXYBULUSOyPO
 f/TCitSPfj3LVwB1DqmZqKJxu6XRv3PkjeKSnWHYuo47XGd1LO46n6cXtXdHAesoheWx
 4Xh3Uf+YD6tO6rVP/L+EXQOLSezL2Dpu0xU4PEd52M+K7kj7eVXMjgA6nxzxSp8p4a4M
 T7HUw5o12Wi5XL8fyPSOWVZ6WtxyI8x6UtE3KJMCP1YgxBFyJIRIMc88Vfg2ta5/ornw
 TWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692708709; x=1693313509;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KcLgdDz4b1eBFUGSU1LTPb50x5JBw9cIhbPd6cA9LcM=;
 b=IT6qMvQjckErKna7oaD5VPLT3XpXy/b4z6vLsxHg0fnBzsOq+oVObS8ac7cguYNAOB
 y9AqAfyhWmxIVauZY7+l/L6K0N7i91L/XOUcFBS5CGVJ137/cTIbVVS80CxfVpBsFVfW
 6W7f69fWCAclrbKYDAJazJITF0i/xan/zkiFNMfR0XU6Fzl/FsaUauzkUsHulUN8B+iI
 icajNFt0XZ8NjoE+oy+l3uokCkpucTO/2JQFgDEXypbD3l14l18epRySKy/GLtYIs58p
 Tb5TLmS7S1R+jD2kFcHRo/3+oE+OJzY3DdhO8Yr/tJtWK1pLvwqYklxUkSrJ1sIkX0+Y
 fnmQ==
X-Gm-Message-State: AOJu0Yz/+J/sETiLOVbAtmH1xcuZRIdF3Nh32xsIGgvHXnu15Ubo0x+I
 M+/MgMnyZowmt6J92y5rBOFGoHc0/ZYkneXj2GiRR8DRst3ejg==
X-Google-Smtp-Source: AGHT+IGjVaORZsSFea+AAhX2rs61rgU5/GxkWwXd1FhgOp2+PF6EEOEIuPVmPsiecMN/IetLxb4nSIVNxUa9Ti5QXlk=
X-Received: by 2002:a2e:9687:0:b0:2b9:f3ca:e35b with SMTP id
 q7-20020a2e9687000000b002b9f3cae35bmr6921234lji.44.1692708708574; Tue, 22 Aug
 2023 05:51:48 -0700 (PDT)
MIME-Version: 1.0
From: Swarup Kotikalapudi <swarupkotikalapudi@gmail.com>
Date: Tue, 22 Aug 2023 18:21:37 +0530
Message-ID: <CAKpU6DeF_c2p1b2m5fbeu1oFMp=JM_KTF+0pj2As1DQYtUunqA@mail.gmail.com>
Subject: Request to give permission to post message in linux_kernel_mentee
 mailing list
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
Content-Type: multipart/mixed; boundary="===============0265374116055737402=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0265374116055737402==
Content-Type: multipart/alternative; boundary="000000000000486ca70603827567"

--000000000000486ca70603827567
Content-Type: text/plain; charset="UTF-8"

Dear Linux Kernel Mentees Group admin,

Please give me permission to post to *Linux-kernel-mentees *group.

Thanks,
Swarup

--000000000000486ca70603827567
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Linux Kernel Mentees Group admin,<div><br></div><div>=
Please give me permission to post to=C2=A0<span style=3D"color:rgb(0,0,0);f=
ont-family:&quot;Times New Roman&quot;;font-size:medium"><font color=3D"#00=
0000" style=3D""><b>Linux-kernel-mentees </b>group.</font></span></div><div=
><span style=3D"color:rgb(0,0,0);font-family:&quot;Times New Roman&quot;;fo=
nt-size:medium"><font color=3D"#000000" style=3D""><br></font></span></div>=
<div><span style=3D"color:rgb(0,0,0);font-family:&quot;Times New Roman&quot=
;;font-size:medium"><font color=3D"#000000" style=3D"">Thanks,</font></span=
></div><div><span style=3D"color:rgb(0,0,0);font-family:&quot;Times New Rom=
an&quot;;font-size:medium"><font color=3D"#000000" style=3D"">Swarup</font>=
</span></div></div>

--000000000000486ca70603827567--

--===============0265374116055737402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0265374116055737402==--
