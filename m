Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB6C1E1DE5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773459; cv=none; b=EbvziiS5Jeze/wfH+RTLBwD1LYmpbLnaODEuK258vEUZJ7wplfQoaHJ4oq4P5pwDttN+5kI+Erc+8zt441bs5vjshu4EySkYrxWiDpUY6hnO5vSHIT+ExsmyNfhIS2CZaQGbdS8Nw/gpVmJeTcBqNOfWap5X7d3Q6HqOYNc8v6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773459; c=relaxed/simple;
	bh=KEheuGKDa3xDyxK8dtla1ri7UmskiUWGGO05j4SMl1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnMhyIOjEguJKyM5N78isHD2FY8P3yLHLSmE+4invsMpk8aMbMufowrC6bqRvCX9IkPUaCA0qLof7TUqpsyDwBcbTRl/YnkiMWQzB6FlBbKbTePW2345fDc28dhFM375tBxyVfnXhzhchwdSjOyLXZht6WaA34YJ9hItnig8rKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGrorFeO; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGrorFeO"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E7E40DAF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDH3TnZ7-DOv for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Apr 2025 13:30:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0AFF440848
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AFF440848
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JGrorFeO
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0AFF440848
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:30:56 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7c5b2472969so200369685a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 04 Apr 2025 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743773455; x=1744378255; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KEheuGKDa3xDyxK8dtla1ri7UmskiUWGGO05j4SMl1w=;
        b=JGrorFeOFoVhrQLpIphO25P2Og9bSlC/KoMWVQFCS91MdWYS3f9xFuW1/oc0OEOEF4
         +JOWFb+XnV/fZF/iQY94jK5Pa02A4OyHVuN9D3NayLjqBwvTXaQght4owQ8k9RXCCxGd
         OIu9IYwx9QZHLi9GMjPIhrlWdeqc2TKHxBjYaCFXM2+Au7Cs1abFfNrnr6M+gtSjwU8J
         hG7EzRRQv/+5SivIuU9wQoRwU4sw42fiIZdjnLDFAEz8XQRkKdWblEF7L35caawTH4s9
         q2WkpiM99vpt+ydvhkFY32TVcZfY8BdxguJzFp+H5rZJSUZITb+K9FG9uxjSvwjaRA7d
         hOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743773455; x=1744378255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEheuGKDa3xDyxK8dtla1ri7UmskiUWGGO05j4SMl1w=;
        b=Ny2xN2FAe8G3VIzA131Y2Ya+bWrwF0t+OsLLfWSlZfRisv4VAg0qSGp79v0L1nt12b
         Tx1Fnm4bv9GTShKfGfdlTM2vFRX5sxPhecvVO8iHnxAzQO8M3Uhg/+xVv+8c7N/zi7UL
         0RGAvGMSb5rCjkOvQeKyb93R2bf/zLEANew88IMAmGcOvbAN0d/wjHlOyZEV4BJ7QhCM
         81IYxuEblPBn4gd9EhPLx4NmoggfVQMcgvSs/+zOfVcsQRWdhFUI/M5kvS6EdeLgFRud
         dHo5VZaAEilQ9CtVJpjEK0uvnUtv8uAAR0QhovftG86UTHByuHKxGdvdwnm0ehg+Uk6H
         1ySg==
X-Forwarded-Encrypted: i=1; AJvYcCWUPnI++XKy+i020eWMtQMIKQiid7teYRYjD/H9RcnWu1Ojbh7a7O7JU8chBZdRUJyr+5iZiv7d+JCLYA1BNTBa7OLuDA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx41fzxu/QvAenIdDnx+O5k55sMqdostFBhOZx+7lPyC8PbsAlk
	chjNuUWN5r70f8hzijLVVY6Q0NMgfO6Atwp1hHDaAl2PVLnhKQf/1lqxs8TYJUQpdJOU2srd5LD
	Xypu3yVU6HrE9O/jIy1LxvHt5SFk=
X-Gm-Gg: ASbGnct6P2FT6V5IYAB2xstRpAun6hV6nkg56QxZ34h8fR6vaTqhlLCFZ+fVt/KwiGJ
	hkZeyod6/LCPHlCiOiyo/gQ/kzJ3T7hxxQ24aFGc3xYRT9qD+e8w4JhoDLRPzKz7g5cpXx7WUVU
	XknhFgTrDynVylnqe0oepz97klLwWPIvTLUK5tfPc4gptV2dKk/2Rt4F4=
X-Google-Smtp-Source: AGHT+IG74nCo6Nd7B0/H04vVPUhu27C+aSVBiz8MSHiHl9a70VyfzXJteEMrg4awfqIW8agEuRHW1vhfqJGHTki99cs=
X-Received: by 2002:a05:620a:c4a:b0:7c5:4949:23ea with SMTP id
 af79cd13be357-7c774df5ea8mr378073285a.47.1743773455589; Fri, 04 Apr 2025
 06:30:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403191342.1244863-1-devaanshk840@gmail.com>
 <20250403153651.1188135b@gandalf.local.home> <CA+RTe_gHo3U-tWM9MA4CMgxM13=biqkqnAbuS5Yuidrono1bvw@mail.gmail.com>
 <2e5aae65-316a-48c1-b293-041bfbd1ed80@efficios.com>
In-Reply-To: <2e5aae65-316a-48c1-b293-041bfbd1ed80@efficios.com>
From: Devaansh Kumar <devaanshk840@gmail.com>
Date: Fri, 4 Apr 2025 19:00:44 +0530
X-Gm-Features: ATxdqUEIAeQDGiq2YwZYgVB7Lp4MkBRHfwXEjEocb6xeBIEiJbPMpiIU8boV8DE
Message-ID: <CA+RTe_j71dE2us0mjPfyEfThKDJ_xUQ-SwFr2Ykx2AoT8yFJBg@mail.gmail.com>
Subject: Re: [PATCH] tracing: Replace deprecated strncpy() with memcpy() for stack_trace_filter_buf
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Apr 2025 at 18:24, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
> It's not only about the destination, but also about the source length.
>
> AFAIU, turning a strncpy into a memcpy here will overflow reading the
> input @str if the input string is smaller than
> sizeof(stack_trace_filter_buf) + len.
>
> This can trigger page faults or make KASAN unhappy.

I see. I will create a new patch to fix this then
