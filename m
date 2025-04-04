Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242451CEAB2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743775045; cv=none; b=m8PoFTu/AXEFFrzr80NueNugFyu9W4XjE8q+XBGWhWOzXywhMsJNmztDtODlARhfnjiX/SQZVW9U8TiiKRQ0gJ/ZcircsE99cegxdjQDald2CiMDFxBsOazpZ1DvNOBr4/HKb7YjCQATzZUOvPfR/lThosHQBnMqkPp09Vaf5zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743775045; c=relaxed/simple;
	bh=BS7LwVsvcEvds4fCDGwH2Q9oRA8LVtJ3ewWZlMLWeDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eaLrn4QSCyqafBEbkivdA9l4C/mSJyoSNkc0S2lmX+1jNEVu0iJ7t9WUzfmwuW7f2xCN0b0Yn9QgUcia5R2y/0VlAVt6HTCEOUcH1aJ07jfYsQwIHS/KRHf9PkWFWPjNYA6BT0hO0UzkPAz9yIF09tw9FA1U/3exYK32d9M9IPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WC7EODY4; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WC7EODY4"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C27C4408DE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjlrBAn-KEOT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Apr 2025 13:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28CAF408D4
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28CAF408D4
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WC7EODY4
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 28CAF408D4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:57:22 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so24124526d6.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 04 Apr 2025 06:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743775041; x=1744379841; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BS7LwVsvcEvds4fCDGwH2Q9oRA8LVtJ3ewWZlMLWeDc=;
        b=WC7EODY4M6JQtgJyWv1kidZVXETStirvttkpcAd6V0McjosqEwTdRr5f78Fj9mIE2M
         nirY/68GAnUSE041dc/f72+J/+aXovuzSDTn3GTQO9PBKSFQttBPSDYDt8wPzVupBqLG
         ZohJK58OO41j+cuYWvQtwpFJcJ99SWKZAo3IgiDRohE6Ac13J38r4Bx5aXnUCGC3dr2T
         mRXBxKxlfgUxWz7+zM4WqCqemrOsRQyuA4haS0cyXC2UOGmZQUlqmS+yv/MZcX2OfVCd
         ct3ZW8flTS6gda4OsJ4LUSGYPlCIj4u0AMyOrXVDprrkfv2zca0iHJ5YETT9x//YK9D2
         gt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743775041; x=1744379841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BS7LwVsvcEvds4fCDGwH2Q9oRA8LVtJ3ewWZlMLWeDc=;
        b=mmD810jJW4K3+xBRLUVjriahUPCrZgFLi3u4gdx1y/eES8Zqa15bjur91gClfmJlRK
         +jMG+n31IixYnfA74xk2spiSgpKFE1QDOXPBtB6Cgq9ZTtBJhXHsNbgLiueVUzXNwbZ1
         Fsmfl1pc25l3/exqaRfGBy/NuUk3Xe2spHCwcvKtlfvwWSkhwmGw7aMidv2cZodUeesH
         3iq9SMQF3+Wuej6bZkgMMDtqUMFTLA+fS7DhTJesxzDb13ES9jejVoYIsSAMfKaQMpHQ
         u6DcSZVinA9KcrYrQXYDYi/L6DV6zDPBVMsGnNNWT+l/LsfqB87SWVL3rSll+1AhQ3UB
         O8YA==
X-Forwarded-Encrypted: i=1; AJvYcCXBMgvetcjMRfTPpmvVQ2Q2nwujzhfQHRzwZYDHZOb/EgMe+xH4X9KyAue4lNcgt9/J23ezMCBD7Z5yaaBGYOLSsQbOAg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzH8Fm9nCa9vCLtt6dtKJ+zCEK5YYSXzbenaVehx3tbKE1+4npf
	8zEXxwlyqiVShpRcjZIGfEjdzM9/RrD4aG7f7/zEqbQQ5tW4RqYIbkJEytHksXyUb50MWVjWDH5
	hxCKTKodalK9BA1DPFNRgRs13i4A=
X-Gm-Gg: ASbGncvk7QM/4HetajQzuZKEKvKnZ9Qg4mY6Hb0dlRQdEwf7z9LeBnkPWA7SFsYVAGw
	ttaw2qT3upGPeGXXmPcrcYbm2HHoIfXoro+kU550KwdtkMGcHfpej3ZdrgsE8PSfA6DU45cDTP/
	Eqc3s5oKwHQDi++pcH9Ejq0kxoxzqUFy7vnqtGl/GQU+qA
X-Google-Smtp-Source: AGHT+IGHn2FxotW2K74/AfRMWLHzCd2kOAhDB0UVSAw7TQFTim+PGN0TdfATtJXR6MwUUceFgiKPYsxXJcHWwvcRNz8=
X-Received: by 2002:a05:6214:2466:b0:6e8:9d00:3d67 with SMTP id
 6a1803df08f44-6f00deee4b2mr43322626d6.15.1743775041513; Fri, 04 Apr 2025
 06:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404133105.2660762-1-devaanshk840@gmail.com> <20250404094632.26f5b7c0@gandalf.local.home>
In-Reply-To: <20250404094632.26f5b7c0@gandalf.local.home>
From: Devaansh Kumar <devaanshk840@gmail.com>
Date: Fri, 4 Apr 2025 19:27:09 +0530
X-Gm-Features: ATxdqUGcnbjHC-G8z4L3wv_hPbaBN5fQCbL76tCeeJ2o_WE1xtoUrcMXyu3g0Sc
Message-ID: <CA+RTe_h_rUpKaLpvZG=49BevKmCudiqOPSyWL3-a+ceH9Z+kPw@mail.gmail.com>
Subject: Re: [PATCH v2] tracing: Replace deprecated strncpy() with strscpy()
 for stack_trace_filter_buf
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Apr 2025 at 19:15, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Is string.h really needed here? And if so, please keep the upside-down
> x-mas tree format:

My bad. It was auto added by my IDE. It is not needed.
