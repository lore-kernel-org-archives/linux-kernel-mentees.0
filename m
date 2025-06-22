Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489189476
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 22 Jun 2025 00:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750552170; cv=none; b=Sj4vQmTyI4+ZIgkOsq6E/rww2cWsjRQp5vVsgFMzEc3G+2nV3hPqHu3LIL+DTQoDnK914ayt35KH1GSmlJb3hXPSgbv09+oGozfzniw1WPBOJPbAbylPnuEsZgDkuYhEQWQAPse7uWXswpQNhqjpaawt0+OLEx62AbUzj3TgFGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750552170; c=relaxed/simple;
	bh=hI+Zhuz8bFn6PZXyMSEYZ8CImv52KMaNsNYyPuc/R+s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tu0N4/g+3JCiyMGLs1b5CvZx/e24jpM5lxPMlUXqD101o3qYEvsqakfZuwOe63oWj+4tNi0gwrNtmnI/WVYRzNjv+SNm6GA77yqEk/1Bg9CMcW5Q+kz2K85SUhU7OKGvd/fJJDasLQzUBTtQSsonJZpQPH8uh1oIex8B9lgvx/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OS/KhQvx; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OS/KhQvx"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2ef461b9daeso553316fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 21 Jun 2025 17:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750552168; x=1751156968; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tn3CEgJGOR3Ob8tjC+rzFCWdjH1CAjWR2bbjAMTsjt8=;
        b=OS/KhQvx/KWU/sOd4qj2T8rdqFtLDZluT1ABSSmp6Ag374vrtPoDbwzAD87cxxuDMF
         Y+FGc74NeOGep+1bXwQ8UMTbzm82kSlwgl1lVQn9usKM0RPiIGagwiNOfW3jMbB7H8oG
         9fEv669AP7WwAc6FSDlb8sDlXyTqQE6M8v+pR835b5Tn/MOfH9f08MhVEaGWEFvb9kF0
         u12tCM7g59WzkawFwv1A/OpwHiF4zjiaF2MwXwDPqbnz7cv33NwhAFthmFjEyK97nZFg
         X5ddnEU1ZCaIx9r2gLE8Zh9oD1hgUTc03DN8ufjQNb/1plwUm+nLmDrY9s/Ys0itKQkb
         6uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750552168; x=1751156968;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tn3CEgJGOR3Ob8tjC+rzFCWdjH1CAjWR2bbjAMTsjt8=;
        b=PtHbSPRBA0nCA0Ii+tqZXEPeaeU5yLAquu2FbCGprLhotEs6F+232smhdnN+C3MdaJ
         u37ZkMCTsRxCNP1Fzz+jmlw6ML7fj/1H7SnQKhCCyNKq/c3jba2x6VdPNxiZr2JdHk3t
         pq+MmaemIAZEMWpsf0cniAQsjPaBBeWSccEKMlBYMc4Q8gbvNeMNXBvfFCFkk/PAwLwW
         56TI6ihL9eXYKSuMTav3zCBdxlTHOzMdpfKb0kcyRjlQvWRtRE0emlbY9Z6PmgPv0/UF
         mFl9/a2lYU8MctHndbNp7JlXB5gmFR8WaklpnG2XK8Pg1W3ZjDnku69xqcwxvannQ5UH
         nhHA==
X-Forwarded-Encrypted: i=1; AJvYcCUCn6vPjRISXHA6X5u0TLF/5SiBN74WvzlG3BFXkqtXSp5RA99ZTiWV5mxXKs50Wy7z0YvSZj0tBtkpIGxa0q9pRKXTMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoqRp1rrQBKkII0Ze8uo/vCyLII8B3PpQUnFxbhfNUnXltbDGK
	UmC1XqcqTJjJnhG9v5c3f8p1PQRcP9+7KaAyDGX78DhoHkD7QKSwra2vhSPiG+ZNXCJw7f5dha9
	j2XPAlNeF1/e00d4MiZGqhT9MtBVhIG5vrQT4LrA=
X-Gm-Gg: ASbGnctVFVvXME2W7XNwnjGW2i8FWpN4PWi2rgaiAb6Q0BxnYTZrBwvNMAVjsyjPC6y
	9qEntOrucxcUG6HPmQRHSdu3pZZtx4tMfkyPlVHQLHoopbHdlECjU4UV5jZwpAr9CrMiwAcLlvu
	9ZjvvFFBU/pfLNEvpgTvABbQSuKulIKSMiKSW6BYVH7aE=
X-Google-Smtp-Source: AGHT+IFK38VlmGELObKJLzPYSulmAj41TICIxsrAffoB9ekWWHnosw7UHuprpIf391mooVOXGuUnLi+2NO22HfXpJ8E=
X-Received: by 2002:a05:6870:238c:b0:2c2:dfbb:2dbd with SMTP id
 586e51a60fabf-2eeda55fb5emr5155564fac.8.1750552168178; Sat, 21 Jun 2025
 17:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ryan Chung <seokwoo.chung130@gmail.com>
Date: Sun, 22 Jun 2025 09:29:17 +0900
X-Gm-Features: AX0GCFso6K37KAiTDEqZ7J88pOxiww5u_GtN1_xTthyhUGMcuObeuCO2WAQ0kL4
Message-ID: <CAB1jyqxWnmpu7mn65jNRkb3NuirayxWHO7TLnkvR5WqcOJPNOg@mail.gmail.com>
Subject: [BUG] No Sound on Samsung GBP 5 on Linux 6.16
To: linux-sound@vger.linux.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

My Samsung Galaxy Book Pro 5 fails to output any sound even though it
recognizes the hardware. Below are the details:
- linux ver: 6.16.0-rc2
-  lspci -nnk | grep -A3 -i audio
00:1f.3 Multimedia audio controller [0401]: Intel Corporation Lunar
Lake-M HD Audio Controller [8086:a828] (rev 10)
        DeviceName: Onboard - Sound
        Subsystem: Samsung Electronics Co Ltd Device [144d:c1da]
        Kernel driver in use: sof-audio-pci-intel-lnl
        Kernel modules: snd_hda_intel, snd_sof_pci_intel_lnl
00:1f.4 SMBus [0c05]: Intel Corporation Lunar Lake-M SMbus Controller
[8086:a822] (rev 10)
        DeviceName: Onboard - Other
-  cat /proc/asound/cards
 0 [sofhdadsp      ]: sof-hda-dsp - sof-hda-dsp
                      SAMSUNGELECTRONICSCO.LTD.-960QHA-P12ALY-NT960QHA_KD72G

I am able to see and manipulate the sound settings through
'pavucontrol'. But the hardware outputs no sound.

Best regards,
Ryan
