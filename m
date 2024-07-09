Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2237729422
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Jul 2024 00:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720485950; cv=none; b=qkhplYHhxb9Se5tRQA7gPAEFHz3K60uRLPk5RdeR/wfr5M6I03x1BWbcmG5Rag4SWRwqwiysHVdCRxtSDIiVHTJT38LqEWAO5i9AVO25mKw+1l/P5FmDXXx9hRjmIUS1QN4bydPMsOitttTXBZtmPuJYkKUqvpBr5j1VGlsbAFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720485950; c=relaxed/simple;
	bh=yVpmdenWty9VmRTaqVs7JI1s/mmytLE9QKXnW4wz6IA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQmPppEw0quaWR1iXVgdsykO4WDoYE95cY1T/G27yJremA+iC5RDPUhLLcQSuw6e2tWoDrrm9EeoJ1MD2JUbAQ5VoyBmdIvHe2ud2yE1V6q8TSKaM9ITWPxADkA2RdQfGUaeLROm80vZlqyJHXljHuIdJEgy3s+aDXpW+3VB36E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbMMWOs/; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbMMWOs/"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3D12812D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Jul 2024 00:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HKjpoRgU2SY for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Jul 2024 00:45:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com; envelope-from=andrewjballance@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5256812D3
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5256812D3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lbMMWOs/
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E5256812D3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Jul 2024 00:45:47 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7036b87752dso883812a34.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 08 Jul 2024 17:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720485947; x=1721090747; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9iPtF9JSiTmGcnXmpNXmV6InuM1mMBUZC3N3YyhPMc=;
        b=lbMMWOs/nGNe82bNJSC7UatmCelNqOqj/7QE4osy0ZOP0JlbhmHUpeEdHvscFjw4k0
         LSnUlygI59OhAb/ijy5g8eHqIGxNfA2bwcV9n7NU3AkhA2+FT0F3i0I9EbdBmStXZwvW
         v1BJe9W8w0flrzYf6aWi/POiJsjBvFaBoQd1ZnQv2qMXFnURpMF7eYI4iMYKwqpF0jd6
         8W0PWLIuyutPUR9bl12bAtFQ4kLaSy3wmlnnT6quFOYipfBz6f0n4pAGUSEB34+a3Dpg
         pyYh+u0rq3bCrZ4PEZOl3OPPwuBfHJHTJxnUuSkvvlmBKKofb10YLKXZY8JC1/NmZrl4
         IXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720485947; x=1721090747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9iPtF9JSiTmGcnXmpNXmV6InuM1mMBUZC3N3YyhPMc=;
        b=qEq47xVg9RPLu/8xX58GshViGOxmFC5bcPy2xtkrpIkQMi2401rhkzTKnlDtZQ6BA4
         trWQ//KLxzQstbHhvrrFvB4EaLxU32x0Jb0Ta2a96lyhcVQ/XJj8YjFYoPfDrSXIbZ/r
         O13J04xqUR/ojtWcPivPSqZ5mMLYzwVKMwbhAEll9cUgbT0uABs0NOHQjtTKr1q6f9sP
         1ZNjQp0DCNsupwEsByr/5HXf0i9eZO+79mHkGjmsFxOy1rREvtu67AVNozmSO9B4gRhJ
         JJu9CRI5Qy2NDNA3blVccKd4UDmvNEJZ0gs8FZX+olyrS0j16e140YxVOOA4Sh1eqRcT
         Xw2g==
X-Forwarded-Encrypted: i=1; AJvYcCW8TehyoOQNarI5iQXLisTButvsW4zJozLh7CyJ8EcIUmbBnZhvbQpbViyus+gX/RFOuBMf753X7mAIG1dp7uHaThnjc0if9SV4xrKAejqm4vpWdspWKEAyKNLowXaa
X-Gm-Message-State: AOJu0YxAwVWr3ojYvUmw9+8if70ntFvg6LIC4y+DapE5hXfC5Ddpx3Qx
	Qn3UzK2Ny4CncyYyO+a9LP+0+9CrDyK8L3bhageToRXs9yxCFbJx
X-Google-Smtp-Source: AGHT+IGG1Ld6V99SNEvuuuZYWfNfTXQ3dsVI4Y2qI2ZXJjfOBhOEzhq/DHbMG1KQ5AaHayz4uRoQDQ==
X-Received: by 2002:a05:6830:1d7:b0:703:6496:b9ab with SMTP id 46e09a7af769-70375a06f35mr1332946a34.7.1720485946711;
        Mon, 08 Jul 2024 17:45:46 -0700 (PDT)
Received: from my-computer.. ([2600:1700:e42:d53f:19e4:45d8:10e5:471e])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-70374f6b5easm231026a34.14.2024.07.08.17.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 17:45:46 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@samsung.com,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	andrewjballance@gmail.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@redhat.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	mcgrof@kernel.org,
	ojeda@kernel.org,
	russ.weight@linux.dev,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	wedsonaf@gmail.com
Subject: [PATCH v2] rust: firmware: fix invalid rustdoc link
Date: Mon,  8 Jul 2024 19:44:26 -0500
Message-ID: <20240709004426.44854-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <CANiq72=6LSGwRsc+deE+U8H=mdgFisrKEPOYgVkZfHhGm8hwog@mail.gmail.com>
References: <CANiq72=6LSGwRsc+deE+U8H=mdgFisrKEPOYgVkZfHhGm8hwog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove an extra quote from the doc comment so that rustdoc
no longer genertes a link to a nonexistent file.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Fixes: de6582833db0 ("rust: add firmware abstractions")
---
v1 -> v2: updated commit message

 rust/kernel/firmware.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 386c8fb44785..763d7cbefab5 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -2,7 +2,7 @@
 
 //! Firmware abstraction
 //!
-//! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h")
+//! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h)
 
 use crate::{bindings, device::Device, error::Error, error::Result, str::CStr};
 use core::ptr::NonNull;
-- 
2.45.2

