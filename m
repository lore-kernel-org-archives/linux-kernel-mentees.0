Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AE41401B
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 02:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755571948; cv=none; b=aQ20sYjVgqN2p/6I0mA1rCDRlj8miDLij7vAy8ZJrSbSxFvO002lf7E88T9qwzgIs/EigZ/KQqMpRqvBg28K1cEm1Un96Lu2KdssMejwjIxhBi2q9wE0uD976bFzT/qjNy9QnyY+4kfPs1vsIQkSrSpX61FWMMgcDMPGSOw9jVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755571948; c=relaxed/simple;
	bh=8TCDh9v9syqCZtg556uYdrY6e+WV9Cbbz9FZAISmjwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a7s29PvdSGc/0MF0WJi9vFqAine5T4ezLXJy26IgpcAYjVYbniwj61B5OBSdAMsLSNCLIGCmVBg0ZmhI6mtrT/tZHhx4NEfHL0g1fQIbVG1WhaCIUjQLfCITC3JRSSTJP8l/wbWRIuA6eG9hVFHQCKNHtdika9SH0pv1oekVdq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+Bd+dEm; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+Bd+dEm"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-32326e5f058so3461300a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 19:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755571947; x=1756176747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CH2KwpNP3L6st9s8ZTQdVOKVVct0EtCDxjQxgfg+SPE=;
        b=l+Bd+dEmehYcxGTp/rBSoLsO0wFOgT8n7A+a++FwKsKz5AMS1vWMInrvOAlLfYEaH6
         lu7RNiiMosSBpuXM7z5Bx/07pS7YdW0/rEaIqlbhVF4HVH/Tpm05INzaywqGla+fgu0p
         4RvHfNq5INCMEXPH+CqmWJALq/R5LsyStoReI+7EbbDt22Ko6fsjhxszRKF2uivvMWQz
         ZiL/s9tqfiEh/OS4Sk4DTiYZ5Ts3OK/GPNRs/opHyQupbbCLRg4ZhU1JFcI9c0Mg6HUl
         Ja0rA6iJRVR3fUi89Cuz2J7n1fZz6tSsh3ePMPCqFcZXfs16KD+b6/QFF3CuLHN+DGGB
         LGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755571947; x=1756176747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CH2KwpNP3L6st9s8ZTQdVOKVVct0EtCDxjQxgfg+SPE=;
        b=S86+GRabNBHd7aCf7CX5dUk7rlhrXBcxgIDuzgcI0NG7TGCPbi4V1+c2hk54bhdY4q
         3Q4n+7Y8mq1Zuw8xI6uRefuDIeFc0Bxl4mtYRXqc9E7sORPNv917nGquJi6a5B2Txjrp
         1W1npBRNjk8t+ZnQpGqhvjbB4tCmtoVoibSXVXl3wGe6JXW5rKX+ac488W/+afjOVh8K
         Y9y4e4lAER5BD5spIFy8gqZmHylnewZ7XM4J3J+oSDpqw7kr++lXgLwbIxVr3r94UFJ7
         ITNRDhJXcMDpl0HdH/HwhMf1m+AR3DCAfnFlwodwCxIPNGfrvWxrrmbnOyoL4BfrZ1CO
         gWnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9o7OdfOE+g8vy2Dw3aLYo4f7LT1SUB90isvlYkcSs38NepVGbJ7b2VKVvkXsZmoZgNb3poAUE/DLaD8VIV+y/2KfbSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPw+W9ABiRHd5y1PxaSm+PMVVAJCSadUjlOOhvrlMaZMbSwgYL
	YSVmyLc0lCzQGnXIZrxFO2TkL4SKflthhwWI22eJwMR8yZBQeq+ixweT
X-Gm-Gg: ASbGncs1LQ/ySRHcd/OV8wxTAByk31zOcFEmnH9rmixKd31c5e0hPHH4enrD+z+mcsL
	eZYqIYuOcdwjkvRAQYoeChEAjsCg01ge8yuf/l9shBSHuvRhNEAdz5Pc6/3lIRRYp9WhXWTTdeo
	1EzJi1Koz71mfccTfDL6GZz0gwjpUFViuhBhJtO7Ukkdc0PqGld+vfFzjsAKH+cj+WmmSrrFDIh
	88lMBqkvB6tLQxfrP2GPR0xMZRxm0suG+4+vnJwA97EQ5y54eeE5sfTc1O54+KH0mOh67m08dUL
	YLyDCIZ0qCARmqKVZDbquQgf6Nr3GFxZGJUPxcAFJ1kgQv5tluc+h3lbXwA4Me9Ekm3IV4ntmc5
	zOXv/P+2rWRLYkXwbr3lBkNc9Uv9oi9r5aVE=
X-Google-Smtp-Source: AGHT+IEhwZCEHI+dkYJ3BI51GnhpHUygOZNkzScZtnkzkKJms0O4e0OOM2+qIMxChVoyeIS4mD36Fw==
X-Received: by 2002:a17:90b:1d85:b0:31f:12f:ffaa with SMTP id 98e67ed59e1d1-32476a4a2c2mr1561335a91.6.1755571946518;
        Mon, 18 Aug 2025 19:52:26 -0700 (PDT)
Received: from linux ([223.185.134.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3ecc64sm1315532a91.15.2025.08.18.19.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 19:52:25 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	corbet@lwn.net,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: watchdog: cpwd: Clarify wd*_timeout parameters 
Date: Tue, 19 Aug 2025 08:21:09 +0530
Message-ID: <20250819025159.6292-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,
  
        It's easy to misread "timeout in 1/10s" as "timeout in either units
of 1 sec or 10 secs". This change should clear that up.

