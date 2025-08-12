Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86AC2F7474
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 16:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755015493; cv=none; b=mvdm6pdCSfErTXHKogsDEr+Nr9SThDwd1rXK1TnbtjBqE6TVSDbz4+jzC/pQ9k/URfCY596aE54Y+vzTYTqEQWbi4+iC5aFGVhvFIlaxhA2q1f3lDeeefvk7KbllWMDqYghd297+97YkHGuYVBYHP+i+VNWFjYYrU3I21wTG5pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755015493; c=relaxed/simple;
	bh=NO8xWglHx1iAvpWSeJXnHNpFVU4bZ0dQ2mW2d/jSZ8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xcl1spzLFA556u7CkOiBUDQyQOakTnN4EOUenu0wuP73WPvN0VAIXB0TOHXrHhBtGvapEDe8nSC44N+zFVgAfxuttDcBxElYBgDsHmct0EEq3DisBWwAWZnVYrB5U2sSigp5YJeem4o+1C4PCGJs/3x0woKc58RIAjwN40qWeZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1wam99r; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1wam99r"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-615c29fc31eso10774349a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 09:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755015489; x=1755620289; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NO8xWglHx1iAvpWSeJXnHNpFVU4bZ0dQ2mW2d/jSZ8g=;
        b=I1wam99r1sQuR2jdymDvSLGLmCMJQbPJBXqpdqH7HiYUbuolxiRWQ9lOa3TEzQSisE
         ZGC9zPQUlQCzgzgKT6TYjlHZkPExCpUtKJv3Qkm8dqumNnMaTSm9hUPCrdW5Glwaqz9W
         8o5cmPXlxwGpVq40Rwz5ILSBh2BFzmm+jHx5XijPFBYgqor9/BGG+N0u4zKGAS3FroHH
         aDEauKopGRuGbXJ4zj/rey4u19TAKgbDJerLw8cXKkR1SDMnatdALAYtqTFqcxsWq0wk
         1aIxR/dzUnd+QIWoHRWvRPckDdVkAi1SwLnbOMumChPvmb6xTKCFTFAr/ukuX89/mVLc
         oX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755015489; x=1755620289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NO8xWglHx1iAvpWSeJXnHNpFVU4bZ0dQ2mW2d/jSZ8g=;
        b=TKepi4N9/RmiAheVS2ya1jJby+/FgzxwOHqEKOS6/sQnRSgX7BAfnWMa0fs8X0z5Cw
         COKV1P01F3SgVcJglr1cYPptkY6chCK/LcfHn0n7WL3ZsrKtp8KP+dOg2Yvrl5OjhbAk
         VplLO6uInpT8c9DpfFakze2ZKgZRFdS2fbipyG/DNPphjquz0JEuTJIjlA9CiAMWWwgU
         OGeJn5GsOgJbzaVxfSsEcUkV4mrJgU8p+p/ORcsYH1wm2Ydelfr8NrK7HR4ajFt0/Jss
         uYZCAwEeymA/1wfk2MYEmHzuU8V55TCUtWLr+YtqEZxX1W5ETpwbu051CiIlZx3E7gZb
         UFKQ==
X-Gm-Message-State: AOJu0YzQwTVy7KHccQKldxfLQN1x7N+LddNm4rIC+xHeC2CUQCf4Cbn5
	OsItwULt+YTadnvY3GUgjwvCan/sHY+mycl9XOMBNGveLFB8CH5rBjyORZ4U44uQo7mD1gY8pv2
	K4geEJ8r6tqYAyf1bRoTcL+do1Nt+gr0=
X-Gm-Gg: ASbGncu0uzurf6z8yC4CDysD4Tygr+CTpZUIUZQlPYV2glouqA8uu4OqehG232ap1jv
	ya9h/fXJNs6X/rNMM8AkdedISvmihi78kDY7Ly86getdqkWyjC1vBC49QUdo3/bQTULN/WXq3sE
	eYRwMnD1Bn3L/t03F5vIW3+pSQQ3albXMmyVN4knAQ79JRh6ESmajJNwJFP9BBbZLF/6lh3WoHB
	H+XFCnba+FYFdEb
X-Google-Smtp-Source: AGHT+IF68d0bxuEbXJii3NENt0+cyh8gFJ3o2HSQPwRn/c3QelFjsV88f5XAtJ29hqFidV62SYwi9PsMK352++IiHa4=
X-Received: by 2002:a05:6402:325a:b0:618:19d2:7251 with SMTP id
 4fb4d7f45d1cf-61866fe62b6mr333478a12.10.1755015488701; Tue, 12 Aug 2025
 09:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAB1jyqxWnmpu7mn65jNRkb3NuirayxWHO7TLnkvR5WqcOJPNOg@mail.gmail.com>
 <20250808125354.12763-1-apepenkov@gmail.com>
In-Reply-To: <20250808125354.12763-1-apepenkov@gmail.com>
From: Ryan Chung <seokwoo.chung130@gmail.com>
Date: Wed, 13 Aug 2025 01:17:57 +0900
X-Gm-Features: Ac12FXxRa7Fg1YoxvwAQRLj5uhaDDspWLYk9JCTP_ogZiwtjoxx5iwIzinJnot0
Message-ID: <CAB1jyqz2qyzN4r_vmn1tXWswwhykS=7AyX_DwWeqaxeFfFTedQ@mail.gmail.com>
Subject: Re: [BUG] No Sound on Samsung GBP 5 on Linux 6.16
To: apepenkov <apepenkov@gmail.com>
Cc: linux-kernel-mentees@lists.linux.dev, linux-sound@vger.linux.org
Content-Type: text/plain; charset="UTF-8"

No, not yet.

On Fri, 8 Aug 2025 at 21:54, apepenkov <apepenkov@gmail.com> wrote:
>
> Hello! I am facing similar issues on the same laptop. I tried using kernel 6.16, 6.15, installing latest (2025.05) SOF. Did you manage to find a solution?
