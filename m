Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9092213D246
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 01:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753059802; cv=none; b=uNqpLbQjDzZLE4euzfN8XFQIzhRIOY7yj3QNLk9IQLjZJXrdzDqh/+yRnO2hbTRd9IvtVzGYoX+C+p/83/NNiW9ye5oQdA1JBSB9g97o+4Z8upoFNnKF4HZozzL9aGeYASreK7xaIpD/gNOeXCGJcNFdUb/KNnNOa09vhyasVrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753059802; c=relaxed/simple;
	bh=13RqBBEIgV36kWEm7R9NSzcKjcMXxKEm5YELl8tsO0I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c8ivCwrQs+EYkWcDGU7ZKkwmCVtZBVz3R40FLDdC8/XpsawfiLIzbsHkHu68KFEmdc3454kOrA0USDFx+QHkAXfjZJ3uBfLpHKJL6z/sBvRRfKoxrZgJySI27Dwv6W4g783R4JMRD4NNMQbqoKT6SRzi/S7LxGI5pAZpfevIItI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyVl/xek; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyVl/xek"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4912784172
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 01:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4eGQ-YTPzq3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Jul 2025 01:03:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96C9984143
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96C9984143
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SyVl/xek
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 96C9984143
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 01:03:20 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6159e23a6dbso722082eaf.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 20 Jul 2025 18:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753059799; x=1753664599; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9ROY5exl20foQoLOm0gDH9KYBPBVvAtZ8sGEN3WoIU=;
        b=SyVl/xekoixp5UT7L1MZ5HUqQDVGRyi5o3JOr40qzTKOWbDLNGgN3S+pfIc8MPzsFq
         /Tga8+2IFNnKqH1jtgRk/Gt4UgZy5+mUcPnb2zKRzagQXPgdeMuUnYeu9J4TVzsHSaSr
         kmmkIXJMha5XRByXfzVOOFzjkW/vmRa5wfh+2jaqkjjjOzt8lT0rTDjg55mMVHyoFOts
         0liSG8ACHghxvn4LuvU5HH5fH0TX2h5Nd44Go/yKph3J9deFPcuBnrVi3s3HU9rRS9AE
         xABPrwejsmXNLiJgIFt11dQEc2MwdF/oJfOeZvpcieO+nZ+Vi9geuoyInw7X90jj3Nue
         KaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753059799; x=1753664599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9ROY5exl20foQoLOm0gDH9KYBPBVvAtZ8sGEN3WoIU=;
        b=H2ZWFBXMq29OfqVfsifOSZT1UMA6u3Dg+RX71f3awiRRnZaorLvAG0/q7aNO+vyaIT
         usMfNgBHtkA8aN14BA1ak1QJaKKPMevirrJqU2hPGNsx1lGM55r/DHz04n+XXzGg6Ede
         JGIFDEJP4mggXQbtb3ZMLOqKFalhOxyavWsuAK1Wflxd4MjuG1fawFXMcMgmfB/4PLk+
         nMFSV0yvYHFVVSUoypAvvni2hoXIPMqrnIp8xIhdTr1K+b/4ftiXZM6b+C8DhOYPetyI
         Zvia1zkA1Bj0xB3VlOpkrkQ3y7FJvTPHBzqoSxOPSS+b18vxLdcsgmUPh7agV628uqkH
         uMqw==
X-Forwarded-Encrypted: i=1; AJvYcCXzg6lqu7PkiAGFkdEvTmgeZRzlaAOREYz1O80Ti0bm8MdAuKGUvv36pJK60lAYJc8VOyL2H8SFrMx6vcnwDCt8GWE2jw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxTc3AKQzuUk9HKaag0UJJfbxU54yBRLoQ/gnPLM+zKpQR3APof
	DCRNG+uYDHOa8H0QZwxD3ZyInGF0h++12nbLDXdj9biXQ5SA/eFT2yMJ
X-Gm-Gg: ASbGncuIdbZOPFhHQ+ZORakpFEFuYqddP4PFVl5wFJDCkwE+stFAM4kz7Yh/CiL3w8M
	0kZYKJY5SpgNSWEJvsHWVUTIQ+dLBgplyIXrYQ+4zo8/JL6lDNjmsoZn0USchy+yWRu9/g36ZH1
	rmwvuqzK28/HmpPpsWd+e/L8IccssDDKsafFHbnuUDqZff6XQFLXmUeMQihjjUXvUiuekOltVjp
	W0Bq1QYLmqWlz7Bx5ZfDK6eNzcUqQuYxJ7JiR6idoVSGFFbAaB35lhQiB9BCWdDL9Y8ImuoXH34
	Z2q9HrRQl4mlELzYvVOw0rmPW0+S3AGg5lOerJ73KhK2NGThurYjXHoZBgJgWSheW9gwOvpT2T3
	FHMnmohDH
X-Google-Smtp-Source: AGHT+IFPaCCUzN/ADWKDu6A52cd5k3Q07KMXcpSXYIgHRD6B0jDRaogs0i1AjFDZymNxwE3UYyAnLQ==
X-Received: by 2002:a05:6808:8314:b0:41f:79f9:1b4a with SMTP id 5614622812f47-41f79f91fa5mr6510773b6e.12.1753059799514;
        Sun, 20 Jul 2025 18:03:19 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-615bcc8c2dbsm1436959eaf.20.2025.07.20.18.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:03:19 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v7 3/3] rust: revocable: Document RevocableGuard invariants/safety and refine Deref safety
Date: Sun, 20 Jul 2025 22:01:55 -0300
Message-ID: <20250721010258.70567-4-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
References: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refinements include:
- `RevocableGuard`'s invariants are updated to precisely state that
  `data_ref` is valid as long as the RCU read-side lock is held.
- The `RevocableGuard::new` constructor is made `unsafe`, explicitly
  requiring callers to guarantee the validity of the raw pointer and
  RCU read-side lock lifetime.
- A new `SAFETY` comment is added to `Revocable::try_access` to
  justify the `unsafe` call to `RevocableGuard::new`, detailing how
  `Self`'s type invariants and the active RCU read-side lock ensure data
  validity for reads.
- The `Deref` implementation's `SAFETY` comment for `RevocableGuard`
  is refined.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 6d8e9237dbdf..0048de23ab44 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -106,9 +106,12 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
         let guard = rcu::read_lock();
         if self.is_available.load(Ordering::Relaxed) {
-            // Since `self.is_available` is true, data is initialised and has to remain valid
-            // because the RCU read side lock prevents it from being dropped.
-            Some(RevocableGuard::new(self.data.get(), guard))
+            // SAFETY:
+            // - `self.data` is valid for reads because of `Self`'s type invariants:
+            //   `self.is_available` is true.
+            // - The RCU read-side lock is active via `guard`, preventing `self.data`
+            //   from being dropped and ensuring its validity for the guard's lifetime.
+            Some(unsafe { RevocableGuard::new(self.data.get(), guard) })
         } else {
             None
         }
@@ -233,7 +236,7 @@ fn drop(self: Pin<&mut Self>) {
 ///
 /// # Invariants
 ///
-/// The RCU read-side lock is held while the guard is alive.
+/// - `data_ref` is a valid pointer for as long as the RCU read-side lock is held.
 pub struct RevocableGuard<'a, T> {
     // This can't use the `&'a T` type because references that appear in function arguments must
     // not become dangling during the execution of the function, which can happen if the
@@ -245,7 +248,15 @@ pub struct RevocableGuard<'a, T> {
 }
 
 impl<T> RevocableGuard<'_, T> {
-    fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
+    /// Creates a new `RevocableGuard`.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `data_ref` is a valid pointer to a `T` object,
+    /// and that it remains valid for as long as the returned `RevocableGuard` is alive.
+    /// The RCU read-side lock must be held for the duration of the guard's lifetime,
+    /// as indicated by `rcu_guard`.
+    unsafe fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
         Self {
             data_ref,
             _rcu_guard: rcu_guard,
@@ -258,8 +269,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
     type Target = T;
 
     fn deref(&self) -> &Self::Target {
-        // SAFETY: By the type invariants, we hold the rcu read-side lock, so the object is
-        // guaranteed to remain valid.
+        // SAFETY: `self.data_ref` is valid because of `Self`'s type invariants,
+        // and the active RCU read-side lock held via `_rcu_guard`, ensuring the data's accessibility.
         unsafe { &*self.data_ref }
     }
 }
-- 
2.50.1

