Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740F551616C
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 15 Oct 2026 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072312; cv=none; b=EzHczP7uJQsqyTxwae0iS/NWaJYW3WAJAZVPfRve3lSnw7MWN6QuGiv98BjHIYAT3e7TOx2dRVTMd05oyl8bsKKENAxrbB2qelI1ATvpmfvwEp1gOqUHWNXYgfPT5NwNOwkzXVy+XiKCYEX743/NZa9+1AVbwiMPTIl6vDDUSJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072312; c=relaxed/simple;
	bh=Z+OJuFFHDzvfnaKn9iMIyx6qF6UFBBKir1ZIYGD1ltA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j0Zaonx5lRWVp7qnpLQ5+lZiNOGvlC2bKUhzAFSV+6MqQ5CMTpLa/51NUJkEnA0T/lmYmCrzLzc69HZuF5ETvbKrU/z1WmTOXQgBTxc4sq7fQDg7Pvd1+1wy9BwITNWcfxOYkJ0dVDe1pB+ZhyP1W0dBgIB38R8jDhUwojp0TUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdRIqbNa; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdRIqbNa"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso38662435e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 15 Oct 2026 06:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792072310; x=1792677110; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pb2lT+n+6HQvd1ljvbTw9518TzY0iE2FdURBlgBDLT4=;
        b=KdRIqbNaT1S5OM9JhVxhHEEXAAgTqRvfiF2ixSF8Mn7b6flFSIurMmRz3YSmz5CARR
         BjJPM76EvBRALkVX2GjKVfLpTo3UqyZyKQbgOsPyZTqipskhqBsL5UOSy2iE4G4s6ND0
         J+5U6zP96emuXkVzOC+An0CU8CQrCbHlrFyYzZWdRJ4/t3dN4e/iVhAxLDxRy5vpupNy
         tGOcX4nhhOEq3H1D29NC1u8KCCoNTYdNiQo/Vr3sQh/qgZa/Y+lyVs6yWQKjkMhNr/1s
         02RcNN6tKYA5/8Xd5aDz1rmez0FEAs9fvGb4GLFv3nK4IpDvlVh5aIpx68O4BTIAlXTo
         QTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072310; x=1792677110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pb2lT+n+6HQvd1ljvbTw9518TzY0iE2FdURBlgBDLT4=;
        b=VYcbNBIRIhUTHJnWQrGV1OZHSaqJyBMKtPhkWHmj8qPbD0DkF9HwkqdXgnkrCk+nWd
         DeDfcZe2htcUdQN5ipq8vQdEwaPXTELwJw6F5dqvjzy+bOXTZm93ovnGTtFJ27b4zz2c
         Zug/onFURiiyr223bm02QfwomhtsnmLDXsvtgUzbGm1ihTyXjqQbdiOLGCgQiUj7gUWP
         KOBe0C7/37wW/1694z/QJyWcPRld6ssWpHxHlZFOQ3XS8eQ6NXFw9VMlyBodsUTUENT7
         kYRBlLLyTbxxFXchvuoZAjB7SYXa+AmEdX9/aB8bGGmQT64wjs1a4qRwgLvkbColeGwe
         Mksg==
X-Gm-Message-State: AFq9FYIw516xBPd16bvGxezx+wvxY60J5N7T6OC5Am6ZRZgahZcZZLuj
	Z7iqpPx+sQT7VWg1rZj9R2rXuIbN8fdK5WkirDqx61qGIi1gbVbyzr4=
X-Gm-Gg: AYBFou0PTFarUl7/Z1X/Z3536lqoVxTsbNFY5GmawTPYKxOnUhT/M+mK1tBrN0+/j8s
	benLjpB/bpsJN6qzRs8YkY9e5LpvO4Nw8cXTrp+edP4RNjOUGGBN72EhLLKQD4+dkvCRBQkigx+
	BkItjRy2RZSZojzuswWCY3ekW3SDkL6xN8iXctof32FOla48QW8ykdYTteiva/J8JuKA9JcaLVb
	HpT7aH6wEIb2KqhQql/bkcujW4STPrU4kfsJl4Jp5jCtIl9IGb+iUQ7VEayAzAqH3oQOGx1RC6g
	lJfqtwCskbboKEbHmNkhb4vKMLN7mC0m2DxstXxQimiW62pcd8XiXw7CEBuIFPdTV/c+2edaPpb
	AghcF2PlQ8psgyvAV4NBsXD2cMnrCkdw5kn4LckrlW1I+lb2JAkJ+oYvFySg34O6qgQ9ZjxRTll
	PrZXkKa9E3801LMxAcDaBXNXw3Y86VmbXVVGL3djTnvywm9AYGlVzX7LpfhxqsgI6/v8cno6Bgt
	SzbCXWVpUfyB3zOgB1m4iDPUdcpG7EDU6KY9dX7Jlv388UtMCt4Jr9hBbNOitBwEPyTUIUhQI9D
	DqcAfGjrXHpeW2RSrFW82ZL8zlQojNbB4y5GPE7Kcs6Mrl2j0lw8CLOD2B8OCIsZWTS8B2jSW2u
	r4AsTsGIuwSFoa1ljEA==
X-Received: by 2002:a05:600d:644f:10b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a196611aa3mr240527545e9.29.1792072309564;
        Thu, 15 Oct 2026 06:51:49 -0700 (PDT)
Received: from archtop.localdomain (92-242-248-5.broadband.mtnet.hr. [92.242.248.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b303csm69642565e9.8.2026.10.15.06.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:51:49 -0700 (PDT)
From: Jakov Novak <jakovnovak30@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>
Subject: [PATCH] drm/drm_exec: fix kernel-doc string in drm_exec_retry
Date: Thu, 15 Oct 2026 15:50:29 +0200
Message-ID: <20261015135029.22698-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building the documentation currently with make htmldocs gives the
following errors:

  WARNING: ./include/drm/drm_exec.h:159 function parameter '_exec' not described in 'drm_exec_retry'
  WARNING: ./include/drm/drm_exec.h:159 Excess function parameter 'exec' description in 'drm_exec_retry' (did you mean one of: '_exec')
  WARNING: ./include/drm/drm_exec.h:159 function parameter '_exec' not described in 'drm_exec_retry'
  WARNING: ./include/drm/drm_exec.h:159 Excess function parameter 'exec' description in 'drm_exec_retry' (did you mean one of: '_exec')

This is because the parameter is defined without the underscore in the
kernel-doc string. Change the parameter name to add the missing
underscore.

Fixes: bba175a2d4be ("drm/exec, drm/xe: Avoid abusing the drm_exec retry pointer")
Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 include/drm/drm_exec.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index cc2937185a9f..ae1d074ade5a 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -150,7 +150,7 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
 
 /**
  * drm_exec_retry() - Unconditionally restart the loop to grab all locks.
- * @exec: drm_exec object
+ * @_exec: drm_exec object
  *
  * Unconditionally retry the loop to lock all objects. For consistency,
  * the exec object needs to be newly initialized.
-- 
2.56.0

