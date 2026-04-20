Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D1E1F130B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Apr 2026 23:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776726989; cv=none; b=sKERSThVqq1L/85NVvLZ6hnn/CFtH/DXfzJ8U03zpCKQeMuXrEsQOwIMk9LnU2psA1epbfVPSd05Gw5N8FNoZhzo6e5D9AQQoLZUXh/aaXyVrKx/w+kuQi6n6pLcquejSQrKaO5euMcVnfTivkVAbdjL/bb103kzrHZCK6UTTg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776726989; c=relaxed/simple;
	bh=B9qFZPu6gMxLIj/SwhGkVPoYLZcFIwMayN9CaHLscQw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=flmdz8Jy7+LoPklbgT5u2b2A1K80jeWw7dNzBACq1M2z4bh+35uKjDyljgs3y6cx5qyygrI/Sx5MmjPDW7NAvElsHhCdfxcvmoHnOGLwXXZpK71t/RqxtNEc3oQlzz9RdI8AwpFOkiyKRMIb8zsrKtX8t7MQOwzuBcKiqULWGTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMcXxATu; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMcXxATu"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 269586104B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Apr 2026 23:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jRWknouTOuXT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2026 23:16:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::b12c; helo=mail-yx1-xb12c.google.com; envelope-from=ethantidmore06@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 635E26101C
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 635E26101C
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TMcXxATu
Received: from mail-yx1-xb12c.google.com (mail-yx1-xb12c.google.com [IPv6:2607:f8b0:4864:20::b12c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 635E26101C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Apr 2026 23:16:27 +0000 (UTC)
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-651bf4a4140so3724463d50.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Apr 2026 16:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776726986; x=1777331786; darn=lists.linuxfoundation.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9qFZPu6gMxLIj/SwhGkVPoYLZcFIwMayN9CaHLscQw=;
        b=TMcXxATuWbo+dA5m7F2Fszee827frFZOHXe611Y3iELPr8IUx8l6mAWCsb4uI90pLs
         jjz0N0npN/2WUwZGO8R5aagONS9RikU2zWuNltLnMFUlJIEZbCHGQG9kuVY/yLp0qxpZ
         i/abBJRaOMdzVi8+dk+7hKGzr5lRRtYxazAOVGRhVvs1LteikzLRsmOGWYA4218eWT/I
         Dc7BBAcySX0TnHQCzjf/L8/PEUjKDBYHbtZ0yYMLd0HhcdguDVCGap+07eGSgt2es2Z2
         yN0qdjuw9//Qvpt1+hL1UWdTzK9Dn4SX8suvSiNEVFtLkg6X6DsT3XPpbP9EDFmVyh61
         mhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776726986; x=1777331786;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B9qFZPu6gMxLIj/SwhGkVPoYLZcFIwMayN9CaHLscQw=;
        b=e6qwFzBuTSEU/sbTRrDqmm3JmAgrKs9raO7vQK276oZleCYutUB0Q8oP/xLlVmO7+I
         OiQRMpjjyyXyjJdiZY5DLTKTYtWpN6Lval+RmJsmZsdpbbGhuL1biu+uIaQO/31/KAIW
         T034Yy52YlgOeojBCOhxtUnLc64M/s2X4iylNTj0mn8XEznTG8P3maNLrRemwsrRjjEa
         4PrUeJjXrTwP4WEQDgluHTPmhAsP09eB4F9w8bOrhS7u4o2d7iYwZ1OA/5jscqYgSvl3
         jDt7H57qPZwGNw6RDU81CHr5lKXrzDlKvnxRBWES/I8YWH11N9W8M/LqTkIpkMpGIflf
         3nvw==
X-Forwarded-Encrypted: i=1; AFNElJ+H5sGKZAnKwX6kdv7ApnKhmCfLsW55ra1PTfX7m3Z57pqf851z6gy8o1ZeHDBPAyEoC1m3/BovdU/9/o+5QxsT/XDnuw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz4ajtsjUCZKuqOvY+0JeV4OTHyT38wUFlgNS0Xx7I7FnOlt40m
	nF22A+rb1uK7ZCBnlO3h8DjVPxCIfLVwXBxnHlx+R8ZC/iNhrwhnFRtG
X-Gm-Gg: AeBDieuJgwOl88dV9wnagiQCAj5ldRrM4GQ4KUOHU9mpWI3Je2QtsPvt15qcS/EiYCx
	uebnWb9cmGO30e59XsDdhwMfASsDnbrFUQhnLknP7pw5XV2L+NxpwVfbLjfBUMQ3HYFQwHGwk9h
	3atIUEG7zJFzKLfzZFgSpAjczi4QwA43PKzJKBuzDKLKV7vDucjLm/obVepWW0fkRyOhw0BraL3
	p0JNf+JKHu+rBD+PegzTb0Lo+BWdeF6IylB3YMVX6fOizsooC9H9jUFB31MWVFmRDYikmfTV/3P
	FT+tle51tW+K3so7b4Lk2R6szXWjeyfHGOzllxPEhb2oCH8T5ggu75PanO7pyNspU7cRuHshtFd
	/Vlpz1+C2CNRM6dE96RxEks1jiDkrbfUSIVTUqvR9hUCORtW3z+mjHikQAIcfQ0UOj9VdKXwnLA
	TGJCVlVWBC974yYunTZ0LLsR0wX0QKKpNvz5xAeN6lm8Juqxcu5PEST/aZiMk2Nt58Uj7oYiCUw
	B7CbcC9EuYee4aZ20HyUGunJYOUyAoSM6CJ13IOUCA=
X-Received: by 2002:a05:690e:d8f:b0:654:1934:3799 with SMTP id 956f58d0204a3-65419343ea7mr9632638d50.18.1776726985999;
        Mon, 20 Apr 2026 16:16:25 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314b25fa8sm5923425d50.1.2026.04.20.16.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 16:16:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 18:16:21 -0500
Message-Id: <DHYD5F7V8KDQ.3TYZ4U0E8LOJQ@gmail.com>
To: "Robertus Diawan Chris" <robertusdchris@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <skhan@linuxfoundation.org>, <me@brighamcampbell.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused offset in phase 2
 _BlockWrite()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260420044651.164450-1-robertusdchris@gmail.com>
In-Reply-To: <20260420044651.164450-1-robertusdchris@gmail.com>

On Sun Apr 19, 2026 at 11:46 PM CDT, Robertus Diawan Chris wrote:
> Commit c1314fe4d28f ("staging: rtl8723bs: remove all RT_TRACE logs
> in hal/ and os_dep/") removed the unnecessary RT_TRACE logs in hal/
> and os_dep/ files, but left the variable "offset" in the Phase 2
> _BlockWrite() function unused, so delete it.
>
> This is reported by Coverity Scan with CID 1408950 as UNUSED_VALUE.
>
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
