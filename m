Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F40F30FBC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 Nov 2023 17:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcTf88U5"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE6A6612D1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 Nov 2023 17:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE6A6612D1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DcTf88U5
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvKLe6RupogH
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 17 Nov 2023 17:18:55 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 020DB610E3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 Nov 2023 17:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 020DB610E3
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507bd19eac8so2962608e87.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 Nov 2023 09:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700241533; x=1700846333; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9nuRLJ1S3+EQkuj+oZlqv6qH4dTQ9g11Gi/7PxPR84=;
        b=DcTf88U5WZiOz64EHN/Wm5oRFrqBNH5Gb9N4G+cm4nDP/0X8CHSjkRFScvjGxFxxWD
         ySaS3spgCcro2Tkd/pM3PN5NAR+WuxPtP1Yvt09pPzXz83s9Jt1T/srD0D3XNrefY/7Q
         Ntc9VUi3q623yrmPngsfHdovQOgph3fcBHYYGb44sl3XRmG3gpTnzWqzFJeTG/IrL108
         H0zK/mG612TrIdb50G+xYMNMesNlWeLuuS7fzf4Z7AkqOZDFOIEs8DzQbakEn/55oM01
         0ub4Wto2wS4BuSmN85+phz3MgShhvVe4gm/IYm2rcd1BUQ9pxC/p9y024ECZvx0iR2xq
         rhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700241533; x=1700846333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9nuRLJ1S3+EQkuj+oZlqv6qH4dTQ9g11Gi/7PxPR84=;
        b=BIZgX5QwX5gVG/y78vv0vZ58DSWFLPj2/T3ZJISQVyz0jTd7pawdU+Wi3d65TcEKux
         DodQ0YOwNVc24YgkuCIf0m3nFvCdpTpvRpwXIpuokSBibTKhJOFGkOnS2KQasluKVrlp
         N6bhiXCYc3urvIHrKRTbk/dIxeHzo67FXZHJJjvHmF+tFlM5gmhd8S1eYkCmta9AdOdi
         hM1vBMeJ4eOHmYxElUMwodvSAcAw45RqJFYfC5GJO8v3TFpPRqR/7BGdFAbZysqwj65P
         QT3BvtcjWbikdT8x0V01BgIr+MXDtUuBv6NWoezs+SJaP5djvIbrDbSCHbrnKe3hNK0r
         vtpg==
X-Gm-Message-State: AOJu0Yy0TBGf1iiYNYDerFo+rp3ZpAyC9lnWP9DCWHkxbms2dd0qNxlj
	v5znt/+Yw/gluV36lh07LH5cVBivv4CFlgRQxtY=
X-Google-Smtp-Source: AGHT+IGq1tPI4eYPfs2NVjkrFJlW/fMIxp0l26ixli8xQwPegejmJBL93pwV0xOpLM1ZMIhDqDpLWn+dVDVC1wp/JtI=
X-Received: by 2002:ac2:547c:0:b0:50a:763f:ecf1 with SMTP id
 e28-20020ac2547c000000b0050a763fecf1mr176643lfn.12.1700241532550; Fri, 17 Nov
 2023 09:18:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <GV1PR10MB6563FCFF1C5DEBE84FEA985FE8B0A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <GV1PR10MB6563FCFF1C5DEBE84FEA985FE8B0A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 17 Nov 2023 12:18:40 -0500
Message-ID: <CAEf4Bza4fejyKRCdcq0WwrvZ-p8JbMq0MPQB_BGzaxPGHT2EoQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 0/4] selftests/bpf: Update multiple prog_tests to
 use ASSERT_ macros
To: Yuran Pereira <yuran.pereira@hotmail.com>
Cc: bpf@vger.kernel.org, andrii@kernel.org, mykolal@fb.com, ast@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com, 
	haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 10:14=E2=80=AFPM Yuran Pereira
<yuran.pereira@hotmail.com> wrote:
>
> Multiple files/programs in `tools/testing/selftests/bpf/prog_tests/` stil=
l
> heavily use the `CHECK` macro, even when better `ASSERT_` alternatives ar=
e
> available.
>
> As it was already pointed out by Yonghong Song [1] in the bpf selftests t=
he use
> of the ASSERT_* series of macros is preferred over the CHECK macro.
>
> This patchset replaces the usage of `CHECK(` macros to the equivalent `AS=
SERT_`
> family of macros in the following prog_tests:
> - bind_perm.c
> - bpf_obj_id.c
> - bpf_tcp_ca.c
> - vmlinux.c
>
> [1] https://lore.kernel.org/lkml/0a142924-633c-44e6-9a92-2dc019656bf2@lin=
ux.dev
>
> Yuran Pereira (4):
>   Replaces the usage of CHECK calls for ASSERTs in bpf_tcp_ca
>   Replaces the usage of CHECK calls for ASSERTs in bind_perm
>   Replaces the usage of CHECK calls for ASSERTs in bpf_obj_id
>   selftests/bpf: Replaces the usage of CHECK calls for ASSERTs in
>     vmlinux
>
>  .../selftests/bpf/prog_tests/bind_perm.c      |   6 +-
>  .../selftests/bpf/prog_tests/bpf_obj_id.c     | 204 +++++++-----------
>  .../selftests/bpf/prog_tests/bpf_tcp_ca.c     |  48 ++---
>  .../selftests/bpf/prog_tests/vmlinux.c        |  16 +-
>  4 files changed, 105 insertions(+), 169 deletions(-)
>
> --
> 2.25.1
>

It seems like you introduced a few failures in selftests, please take
a look at [0] and fix them, thanks!

  [0] https://github.com/kernel-patches/bpf/actions/runs/6885976657/job/187=
31029901
