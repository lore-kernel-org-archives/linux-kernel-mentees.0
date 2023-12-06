Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9629431A90
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aKhT4XRE"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B1B340308
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 11:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B1B340308
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aKhT4XRE
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id de2xqeooOTSP
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Dec 2023 11:37:57 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7D3E9402EB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 11:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D3E9402EB
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3333074512bso345301f8f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Dec 2023 03:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701862675; x=1702467475; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UsKZRR7fb35TZGm9xzU+NNHL9tg4Q2nzB0Mt74LhSX4=;
        b=aKhT4XREn2VtV9JWsPwtrXh1mvDDHZL9+Mg4Mx9jGGytitcYZCrjtTgnyQpOlkrSVy
         529+SDA+ryEBvS4inRCHjZyt1WxPLmVlQCdkZWNVziXkl1Okm88Mf9S+iEAqqpp6ZsLX
         AkDrt9QxIG7PnLdCmrk11HzG4DvYAdj+8tNlrGT5X8TM7B8rxLxv69K1T+TuKcajPKCb
         ji+++tw3oZNJ9bwhiPCCABW6fpU7FGfICxnb9BJF5to0r6wG7bsLh2RcM3iVantkhzIC
         bGSwwaCVCNeiGS9Dp1ly8UjQElkPVhSZDUNUxfvWdtduPBCLhZiCKzmNDPHJuJOshpr+
         mpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701862675; x=1702467475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UsKZRR7fb35TZGm9xzU+NNHL9tg4Q2nzB0Mt74LhSX4=;
        b=vuUL+iMhlWGwNNdR1VwkEcDbO9TEekTIO2aD9SnUTalzuA4QPLVCBY9t+zsmlfZdVr
         AB9TiDFCc9C7yBUnu2xRVfLCfKKR06vtTG1xFfyUUqZKpH16FoK2MFxLMkc9gO4rKgbx
         1/7zs0ts3GtrOHIhHcblYOu+vSTCHJehb5YAauzofH/EYT44uvOXQcVc9ECP8Z8Dp6pq
         Gr67spdpVhzkHECPtZHG9y1r0PVh1yMkaIlDsWELSLZ4pswlm4Ma6EbVByjyK6xSHmsG
         P5isBCwc1ZJm51ZTDfJHO+yWx647pIEtNqieeS3xsRwtRTQM57s3tzGq3drH/lE/K1v/
         W+5w==
X-Gm-Message-State: AOJu0YwC3VMUVg9WsCDO5GQgHPHcV8rBdBfkMZ4hd1ZQBJjjxeI0ax+w
	5N4c2mfSOtYMZhSignOy5s8ibQ==
X-Google-Smtp-Source: AGHT+IGtAUsYbhUVYEL0MZxwr4M0sLnELDMNsFle3FJdHz2OEGubCuMsgvDyo+NQ/Uio0wU7tRjUGg==
X-Received: by 2002:a05:600c:4749:b0:40b:5e26:2379 with SMTP id w9-20020a05600c474900b0040b5e262379mr1281084wmo.42.1701862675544;
        Wed, 06 Dec 2023 03:37:55 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id bh6-20020a05600c3d0600b0040b54335d57sm17055244wmb.17.2023.12.06.03.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 03:37:55 -0800 (PST)
Date: Wed, 6 Dec 2023 11:37:53 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Yuran Pereira <yuran.pereira@hotmail.com>,
	kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org, jason.wessel@windriver.com,
	rostedt@goodmis.org, mhiramat@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 2/2] trace: kdb: Replace simple_strtoul with kstrtoul in
 kdb_ftdump
Message-ID: <20231206113753.GB81045@aspen.lan>
References: <GV1PR10MB65635561FB160078C3744B5FE8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
 <GV1PR10MB6563DC208657E86715361E94E8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
 <CAD=FV=XpK0T-oPi2Q6-9jELFseSsvgkFtRuXP1LXK6PbV_MwCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XpK0T-oPi2Q6-9jELFseSsvgkFtRuXP1LXK6PbV_MwCg@mail.gmail.com>

On Tue, Dec 05, 2023 at 01:41:57PM -0800, Doug Anderson wrote:
> Hi,
>
> On Sun, Nov 19, 2023 at 4:10 PM Yuran Pereira <yuran.pereira@hotmail.com> wrote:
> >
> > The function simple_strtoul performs no error checking in scenarios
> > where the input value overflows the intended output variable.
> > This results in this function successfully returning, even when the
> > output does not match the input string (aka the function returns
> > successfully even when the result is wrong).
> >
> > Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
> > simple_strtoul(), and simple_strtoull() functions explicitly ignore
> > overflows, which may lead to unexpected results in callers."
> > Hence, the use of those functions is discouraged.
> >
> > This patch replaces all uses of the simple_strtoul with the safer
> > alternatives kstrtoint and kstrtol.
> >
> > [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull
> >
> > Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> > ---
> >  kernel/trace/trace_kdb.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> >
> > diff --git a/kernel/trace/trace_kdb.c b/kernel/trace/trace_kdb.c
> > index 59857a1ee44c..3891f885e4a6 100644
> > --- a/kernel/trace/trace_kdb.c
> > +++ b/kernel/trace/trace_kdb.c
> > @@ -96,23 +96,21 @@ static int kdb_ftdump(int argc, const char **argv)
> >  {
> >         int skip_entries = 0;
> >         long cpu_file;
> > -       char *cp;
> > +       int err;
> >         int cnt;
> >         int cpu;
> >
> >         if (argc > 2)
> >                 return KDB_ARGCOUNT;
> >
> > -       if (argc) {
> > -               skip_entries = simple_strtol(argv[1], &cp, 0);
> > -               if (*cp)
> > +       if (argc)
> > +               if (kstrtoint(argv[1], 0, &skip_entries))
> >                         skip_entries = 0;
> > -       }
>
> Similar nit about braces as in patch #1. tl;dr is change the above to:
>
> if (argc && kstrtoint(argv[1], 0, &skip_entries))
>   skip_entries = 0;

Surely that should be:

if (...)
	return KDB_BADINT;

There seems little point switching to a "safer" API if we just ignore the
errors it provides us.


Daniel.
