Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1631DA106
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Sep 2024 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725453216; cv=none; b=bG/R0in4jbkTxewNwTWIRwyManHrRTdZGMyFXakKrfWALRypzStIcYR5CUJwcQQpVURu36HWtX/Dus0FIJ5FnUIYYo6tlA/eAcU0/QtjTB6GEo633ou9rSFvyuj9tz2ggP9rbt7ZShv59nG/TMKuiPso7Z21meUgDLamPIrQ8Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725453216; c=relaxed/simple;
	bh=YKDCZscyU2vQ/uLd3Ew3F0b96EzQTeTNQOivdxV+9qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ob7m+NsafjxPhHXmaE8KKjnDF4a7VPl4WSxEZeQVNghjP0GH9D1T6gxDCGynrtrU211yosUQletw+XdQX4M+JBFcuPYevQJdiqLZEeKyhMXuaN6LmRL1784UqiU1p4pSog9ePthbxCWwyoDv5B0eHwB8TiAlKywNxYZ/6r5FZ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0jnbcwr; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0jnbcwr"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B8EC80BD6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Sep 2024 12:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wc5QKvgN5AWT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Sep 2024 12:33:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rafael@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C49088042A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C49088042A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D0jnbcwr
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C49088042A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Sep 2024 12:33:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1101AA44285
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Sep 2024 12:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8AC9C4CECB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Sep 2024 12:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725453211;
	bh=YKDCZscyU2vQ/uLd3Ew3F0b96EzQTeTNQOivdxV+9qw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D0jnbcwreHF+LGgrT/u2MTlQc+X0mxwzp02dzQqwE8vqdEllSvDDnKCpf6oD/3tiN
	 DurEWDIfWrTf4yX80idaQHAoclBhCj5/lAZoeEe0Fmchm+OdYyeiKs+NfLsk0YwKFu
	 qpxriyGlxdasAbsmq4mdttpj9C9B7BGm1rNf1JooEmUQNq3Cdfos2KgYq6lyDMcX2k
	 QmRksXEf4rC6IQ/BTTbUVGsZmML+xIaU2Wp5RnnSGs5bqG8uNowNjMijp6vKXYr/ta
	 gAapOsQNuqJG4I77BFPsu6MtRIMVU9Es6jRtKAa0HUR67Nk9Ou5P/F5p9qW4zPYr4y
	 Vdcq+DnnMudnw==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5d5f24d9df8so3690429eaf.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 04 Sep 2024 05:33:31 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx54tNPCHmHb8grBBKWyYTiE6aJTbTQf2rV2xCVVokGaSa9wuxz
	dxJ4Mp6+x/QC0mKrOPXCRgzbjlou+6n0wTyws4MCQ9DW2MokD3u7x60dPPPhAxqqGrIpkESbbKx
	cGvW9rqVI/8xeeLz/bGfU2DqPHfI=
X-Google-Smtp-Source: AGHT+IGU0sxnm3qPEJXMW7b58le6Sz6zJEsfDbYFrUu3U5GQqzrJJXRZV7t23N9424rvR6g9wQBMpRvdlUY9vBnlkxY=
X-Received: by 2002:a05:6870:3d8c:b0:270:1dab:64a9 with SMTP id
 586e51a60fabf-277c8055c7dmr14711515fac.14.1725453211209; Wed, 04 Sep 2024
 05:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240825095353.7578-1-0xff07@gmail.com> <7ea23975329e4a22fd235cc28d365296fec47739.camel@linux.intel.com>
In-Reply-To: <7ea23975329e4a22fd235cc28d365296fec47739.camel@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 4 Sep 2024 14:33:20 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iW5_NcJ8wXQkuObw4nhJbViBim7uLiGz5PghMDKYybOw@mail.gmail.com>
Message-ID: <CAJZ5v0iW5_NcJ8wXQkuObw4nhJbViBim7uLiGz5PghMDKYybOw@mail.gmail.com>
Subject: Re: [PATCH] pm-graph: ignore sleepgraph.py artifacts
To: todd.e.brandt@linux.intel.com, "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, ricardo@marliere.net, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 10:49=E2=80=AFPM Todd Brandt
<todd.e.brandt@linux.intel.com> wrote:
>
> On Sun, 2024-08-25 at 17:53 +0800, Yo-Jung (Leo) Lin wrote:
> > By default, sleepgraph.py creates suspend-{date}-{time} directories
> > to store artifacts, or suspend-{date}-{time}-xN if the --multi option
> > is used. Ignore those directories by adding a .gitignore file.
> >
> > Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
> > ---
> >  tools/power/pm-graph/.gitignore | 3 +++
> >  1 file changed, 3 insertions(+)
> >  create mode 100644 tools/power/pm-graph/.gitignore
> >
> > diff --git a/tools/power/pm-graph/.gitignore b/tools/power/pm-
> > graph/.gitignore
> > new file mode 100644
> > index 000000000000..37762a8a06d6
> > --- /dev/null
> > +++ b/tools/power/pm-graph/.gitignore
> > @@ -0,0 +1,3 @@
> > +# sleepgraph.py artifacts
> > +suspend-[0-9]*-[0-9]*
> > +suspend-[0-9]*-[0-9]*-x[0-9]*
> This seems fine. If you run the tool inside the tools/power/pm-graph
> folder I can see how it would be annoying to have all those output
> directories show up in git status. (re-send with Acked-by)
>
> Acked-by: Todd Brandt <todd.e.brandt@linux.intel.com>

Applied as 6.12 material, thanks!
