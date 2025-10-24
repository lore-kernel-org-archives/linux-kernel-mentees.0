Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F51272805
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Oct 2025 16:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761322764; cv=none; b=l56xR2cRgpR0V3Viru4eimiS9508Q6HIedyPZDiwKc6N3YD4Bz7MhaqXNJD6F2W2Tm5ALm5rS1AQXN1lMH4VApjEutswuCHrvsJvEWpfwhK1ShyO0jigz8sKz+9wd6499VNvjbeXYAKoAjeaYs5dxjumtN4en8skg9K/S0GZBS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761322764; c=relaxed/simple;
	bh=9dAY0L+/fvVVmeV7rFvMJHXnGU8TyAN8gQ32/HzNzLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SmMCTjvR//bu+zN5nwa7Mcwymq+5sLx+hLtuQh2C9xQz2nvZvmdq9p8+4nUgXPK/Jb6ztmIpiaOhWx2twsMJHpwN2oxDIVOuQHps4QtjYkj2Xq++7d2X4WksFLb+OHD0gkL+b27AK3NyhyRflFku6J5vpg8AfUm2PN8SfBObqWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaVfhC//; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaVfhC//"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-290dc63fabbso22709125ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Oct 2025 09:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761322761; x=1761927561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n8lMVMj1fovkZ+i7h1zKI+sBPWqmX8HhUJdjB0oD3U4=;
        b=WaVfhC//rReMo2CqmL8x9uUwLorm+ryWb8XkW7KRYVxgv2nkH9SgHSOZMW8XpiPGSc
         0avBXw/ZpDeMkDUNRnXr+pHDrPDdou4eJ9ir95gL3Vc5UOg1VwmG+ztfz9ZQmoc1A0yL
         coP86Mq0/I+X7pYWq5W1sgTz4xHwGLFPp+b/PX33jm82UeQWPOts4M1wvolbNTwX8pdS
         YSrHwVfIEe/pnWbC18gEgDMypxxPq9u2s9x+EPYhjrja1DJkHblhBlpc+BmGKGXdLrv/
         2STcpjKYlf1N5j+EGVp9gEJY07x8JvsMDV++BYz7z5ixFKQ5XhgQJlZJVmIfa4a0g4ep
         vN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761322761; x=1761927561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8lMVMj1fovkZ+i7h1zKI+sBPWqmX8HhUJdjB0oD3U4=;
        b=wesUGLfO5gaBogMBoAjqUeJ1qO05n2aO2B6gQUg4R42iBr+XoOQ7Tv2q4tLSMrijrw
         HyIE0efGWjBPtqZzxmJ1iDu1UDAQu+uzwkbCJnUs7aXPMmLMYzB8mib8W8Xzwo2IHLcx
         kSJEgYY8I5hko+ehHcEj7wwgi98Ew/PITfUwEnUyYYBii/hpZWIki0iPEL5HNlk1BZfa
         Dlj3Vw8XM6zGgv3zJrnD9yMKRXd+1AKY0bprI+YKjn8lO9AcOvRPs25jPwXH9EaT1U/i
         H9HRGdRB61ceSPXKyHquCKmqox75KR5xrKlmBd5VAllPdTUKZ/5AnPvWawnJqPjUHy1B
         M9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0xSBmPDOHBMYO//1L1yvSQ8q/jhoPY6v6r7aHkXurCxx7Pr3EkprNiRzvttxDJU/XhsgKtioJn3Gay20EUZIP3uAi1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCgbQkegDrkJStkwwz++XISyftwU6M0zdyT0ifr7vipE+ExyLh
	UkYpZ5fd0NhB8ALMLwx63xoRsYlEeWzsZ5RrKpwGHmzUXenYRq+r+UNC
X-Gm-Gg: ASbGnctwYoOkfTmDH/J6YkC7wa/dQlalm8vjmNnaHqXjf9r7yyQliDllkvnZjS12/Di
	iKsfOw3TzTOatSc+kWDAY8QCxvZViJfLDXU4cs0z7t9sSn9v6vTScMeo2t7TU7oe+nvcYkCvyzY
	cPakVBTdJMsSkLC6x6F+DCnL0SL8aKSVpQh9gnAU8VFvTIqG2i6xN6SmCYifxU4BH9/nQMRCGyb
	15Pf4YHKar2s64lDKUhMNWINb4Rb4ugkqtDW/DCrfBFZzk98RV92VaIALwCmnLGkkrtaWuuuMWQ
	mZQVXPQVRrAKAgG6XvfhQxKG/3Mi4niXP1pKBqJ3gfMUwdAJa8BPqpWt0TLa7dD4mVA8Y+k6oTH
	6PN17oEUJChQriZN9leimMDtHE7OzChBuUa+toBHQndEvNYF2DU2NVkiPbHuamH/K3nVQiJsw4d
	4YyMmaRAls1yjsTEU2sCY=
X-Google-Smtp-Source: AGHT+IFNPsmsAl8NXf9o2YdrRIqhrCZlIqmrcjiRIz6/XHVLK6f87asKaFnRaec7IkTrDjOv4+L8dw==
X-Received: by 2002:a17:903:1a70:b0:272:dee1:c137 with SMTP id d9443c01a7336-2946de62ec8mr81593755ad.13.1761322761029;
        Fri, 24 Oct 2025 09:19:21 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274abf6d5sm6277685b3a.33.2025.10.24.09.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 09:19:20 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: shuah@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	khalid@kernel.org
Subject: [PATCH] selftests: tty: add tty_tiocsti_test to .gitignore
Date: Fri, 24 Oct 2025 21:49:07 +0530
Message-ID: <20251024161909.327158-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the tty_tiocsti_test binary to .gitignore to avoid accidentally
staging the build artifact.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 tools/testing/selftests/tty/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/tty/.gitignore b/tools/testing/selftests/tty/.gitignore
index fe70462a4aad..2453685d2493 100644
--- a/tools/testing/selftests/tty/.gitignore
+++ b/tools/testing/selftests/tty/.gitignore
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+tty_tiocsti_test
 tty_tstamp_update
-- 
2.43.0

