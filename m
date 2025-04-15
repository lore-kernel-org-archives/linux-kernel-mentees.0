Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80ED29A3CF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 13:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723544; cv=none; b=g+aHKJlQT349ny4Bny5+w/T+rn6dFdxzr/GzDsrRq+9qxqYHNIFUFWtsFDB8a4trchgiRvANqB+TIMudFZnALy4h8sUnUJi26Gr+WS45CqwDY2Kv3D0P/yJMk2ec8/wqEbypvK1ja57q9SrPAMaDjjIGttQAN8Lt0sy9+WuAufw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723544; c=relaxed/simple;
	bh=UYUxPCQcFjA73UAxP9WXueMfGm86K1IfqKd8pR+K0JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGmG3ZSxWTDK7n38yFnyOllCW8y+A4AxZChBDFZFBBMLDja7IbaJObYWa1IwRtlYiJoHh1EirxS0hBXu2aOWIPbbqVTKT41g99c7tjsqz7vxZMSTyZGD76TBd3IyAMobQqXL83sLtqquxcZP3s32a0fT36lbLpC+49iIXL10eMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FixDfJUz; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FixDfJUz"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79D9D60E83
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 13:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYCA3UpQAcbb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Apr 2025 13:25:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E240660689
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E240660689
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FixDfJUz
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E240660689
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 13:25:41 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7c5568355ffso453524685a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744723540; x=1745328340; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UYUxPCQcFjA73UAxP9WXueMfGm86K1IfqKd8pR+K0JM=;
        b=FixDfJUzI6lkBfPT611dtmttRGI+hiJLixMbieASstUhm36iBMp/5k90r93gm6LEgS
         v5IqICX2+OYxIiVxc0nrHb7hcqahMrvpmrKzhZs0qdCAmdWSkYATOo046kptBDYiknU7
         yNfGuA9Q1ozs2yQo1+7bJxz98QwPIgY8Iu7Fo8U99te6BjwnZz5y49evsVYSVVb2eBxk
         x5jqTsjEkPjWXjc1780aTN1/aFN4pB0FfL6RmMXERJru98XJf6aS3xFy4NKxwIkU0G7C
         JQnr3YtVFI2jU6lg7g5mN+PfW+M+3i0Goc93UnQs2dd4hYNZAAx3xHJTicEZWLWmPisQ
         CrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723540; x=1745328340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYUxPCQcFjA73UAxP9WXueMfGm86K1IfqKd8pR+K0JM=;
        b=qSYt2gDN1/Z4A7zT8dKEPdNgPFrtpxGsuK2EA1DP/ecmHS7b2wu1kYWMXMFGxkir/P
         I1oR1vDwLRT1a3B7lMLIRv0H6Lhp0gJehWEDyMlx3wA8yEgHboAL2srIWMS5Y3eI2Y6k
         QtkcSofQTmN57WYr/5S9dT/1XKhe43eWOmTGGfB4yiF68AYECKDCA5kwiFuPiEYoYbUq
         43ZneswewpLfEYOE8dmFaMHNeAQvvKUxC/xsmLpIVs4nFkuagfFYwELL4eyt+gcO9QXM
         xUtpR3g627/FWE0FJTbjrOFGWNzI30kr5KhvLKa0g6bgt07MKOeC6H4AW2dAlYHIy6lD
         Q0sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvtMjYhqUjoJaPFJxlKUWTMZjb+z0sRFKC8rz/RmNtZmPuPrk7YIc+/zIwZAczXcvVOdRTzsqKzXPHFQ5xHzi0qsSfKQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxXNbY4sPAVBmk3V3frh5nHnkDHX9hcC22JfIPmQp5N6xiT0itP
	fiz6xdt52ne/6ISIEZHLnanbM55oK+4h4hEM2JsCwxtXQiLkh3xonGrqMjevZHuPpnFaHhscYa/
	5aMYlH6GwhP/pt1eR1vXoa3QJDas=
X-Gm-Gg: ASbGncvSow0hARfFPIuxtD2bzZ4+tsDChPxp4q8VQdDcT900HEFOmV9z/rpUpHxtwTA
	H0DDDvuaeGWaMRaSZIsnDV/tJ4VLajb3XqULYS673DDzwL37Wt6kH2gZwbYm/cV8c6//I0Ztnmd
	uVhIpkVvtjEcfOzELucIijYXl5vURmUU8mer6I/HKo
X-Google-Smtp-Source: AGHT+IENUN3q9zUEpgp0yO+rQb1K6OiXAS8mHfuVjSa2hIIBeaF+kQ/tbXuTPbB9DLJpwa+uw5WeJlKVWmA3cg4aR3k=
X-Received: by 2002:a05:6214:23cd:b0:6e8:fb8c:e6dd with SMTP id
 6a1803df08f44-6f230d55533mr226917916d6.5.1744723540626; Tue, 15 Apr 2025
 06:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415130910.2326537-1-devaanshk840@gmail.com> <2025041517-semicolon-aloft-9910@gregkh>
In-Reply-To: <2025041517-semicolon-aloft-9910@gregkh>
From: Devaansh Kumar <devaanshk840@gmail.com>
Date: Tue, 15 Apr 2025 18:55:28 +0530
X-Gm-Features: ATxdqUE4dS_DLldbw8HBu898mJglnFnspTU3D7RHe1XAP46zEEX3kVq6zmxadGs
Message-ID: <CA+RTe_hfdgPTwVX_pizHVnsDDFJoEOQD=dH3KuBXuDbycU0yXQ@mail.gmail.com>
Subject: Re: [PATCH] bpf: Remove tracing program restriction on map types
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sashal@kernel.org, stable@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Apr 2025 at 18:49, Greg KH <gregkh@linuxfoundation.org> wrote:
> what kernel tree(s) is this for?

This backport is for v5.15.y stable version. My bad, I should have
mentioned it in the subject.
