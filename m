Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2092DF146
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Nov 2025 20:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763671640; cv=none; b=N2PGJaPEVa0d3fe77OWnWdZkI2KXrTt4rnhFmi0u08fuSquEp16A3kG5xdoPUNEc0iyZvWxlK9QeMUSlDfrXr4wiA6mZIyXoqTPnVtF9x2pM4oGnpmcAMLmYuTqWxaFP+Vg2SBjW9OT+D77FVl40IohYs/oQtwHUTNM16shK/iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763671640; c=relaxed/simple;
	bh=2K94P+UBEZaujybTCq3ooUqrsVw+dPtWDCc/H848xlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrJtkVlrEdUrEIzS0Hp9EWz1NCxI5DTg5Pn7blMSZG1BYe7jwekZdCyl74eGT3AYOkuc2h9cee3MCAMLJVGjSgi0ncJ0GGtnrjI4rTpV2aQ74UgwuApUU3mPoSQ74oBI+D638hENNzs13qsKh7pzhOrPVDDSN69rTNGG2NhWRKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzxNfOqN; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzxNfOqN"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F492616E6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Nov 2025 20:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2n6obgukDtq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Nov 2025 20:47:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC85961496
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC85961496
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gzxNfOqN
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BC85961496
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Nov 2025 20:47:17 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7b9a98b751eso1114990b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Nov 2025 12:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763671637; x=1764276437; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRzELrjyv1B9QTTtAz67bzAu36xbnz7eTr+g1Rji/MQ=;
        b=gzxNfOqNcDL0LThYXQdvap7P9/ua9dohUVu+ubDOlWAT53YJbWg568aoN/HeD0IbcX
         7cfS7MjoUm73t0rNCKaSk6oV6I86ggSlHP+bTxj7YWWFUZb+ZJLtJFUkMd3BJLbY/J0i
         0J1bhBkW3S54FDZLm96d0saCMVcdS4bWauLPtKZrmSi5H8prliza9T4yFH4MWTAguWO6
         B7giQEZvBLNNqRlMumqBXAXUJhWESBPDANKVhNMIPVuhm3qJpKUFral/X4fVJuQN/4wr
         ANe5kce2GTIKp7yLwKfC1w6NhZ94XzSH+szrMG9miZXoe7bIORwpFhGzh2jYBzril5UM
         ledQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763671637; x=1764276437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mRzELrjyv1B9QTTtAz67bzAu36xbnz7eTr+g1Rji/MQ=;
        b=Ukokj/pYM+iRZOygfCBp4+QqOXPd2OO7c4WqRTP6EcqETaEPAkr0Lp21nkD7vvbttw
         DgONyDSwgMsV9byxn7XHt/y3PWK6aNNlF3Jf+L3TIpHWPz0wILVjavrmSO1PKKd734cJ
         B0tylH1QdW41DkhFbRv9x2ZLQdVUq/gbjCi+KmilylhdZ7hyLjhtazr4ZeF1QoF52Puu
         05fWt7fRFKW0dnlf1GeLZRa09RK0dIZZr6tQwPCyFdAr00xCtyK1WmfCOL7ZWBnToPXE
         eDp4P+3WRILExhZIU+VakcYAo+1+xyTuQhQstiygsyFc82hTWLIRUZFSXHVQ/WJuDssc
         E9Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXZKyaacsZMTvC+j1lASl7niswsKpu5HQsh2tgHchweOwmuLaTHf6buncdfa5C6TMMRHyVjdrAw4r8tOneO6uD0PonLEw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwHQ9dbaHDK8VI87uA8MB/KMU4Rad+gzl5cOaLkIxE8iu0s+gOF
	LAxlZiPwAa4+Z/CIx3fskR838bRuAb9hUXUophFdeQaQIXqON/M4fpWU
X-Gm-Gg: ASbGnctfI4GXlDnoaL0XvaEgq015zxKWbUnnH8qdQ8EE12HpdAVl6dzksd98zImaduZ
	uCxgGjR4p6LsMulFkYhwFw9Jq5xem1EhY3eWIdnN6ukb0doxCRYP3KhEsYbU9F4s6fw3/yRfvFH
	qRZ3q2dbpad20z9N9myw1jnFsNT9HRv6SzjIq0pjTBOQULEdXRjmMI1CzPkW8AELItjUF8D+cWs
	Hgd26O9+VP5QpbCVlbTgq2SFyPWy3qoyWEvDEldwiFcObAEPi3uboGiN+mDC+chlnp3RIUhwdiI
	ogX9c8Xwl2aL2Cezc09BlEBjsoI0CPiNcXoXGWZoXLM/r0ZyDXjK6nCbMQ/A9hRTqoubnuVxZvf
	mUNld5wp+TN1N6wGofZfCDTuXM/fUTWJQoiZLjDKoYawqnBbn7tPsufB/ODAiNYZpYGf8yYcjJ2
	ovrgEw93HvQSex0yBxA7hVZAK3Hv+o/Gftgr0Ei6KdVl9cVT2x0D96fzhNazUmsmHlADB1E9Cv5
	okdHQ==
X-Google-Smtp-Source: AGHT+IF/2lFZY3ga9vjA+9LkLYe1dsMZr1LawsGKiZs65uOepoeLssESml+r/W4m4LoCypHg3vBx8A==
X-Received: by 2002:a05:6a00:2e10:b0:7a4:f552:b524 with SMTP id d2e1a72fcca58-7c3f0d637d6mr5296963b3a.28.1763671636871;
        Thu, 20 Nov 2025 12:47:16 -0800 (PST)
Received: from prakrititz-UB.. ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed37ab3fsm3757537b3a.22.2025.11.20.12.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 12:47:16 -0800 (PST)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org
Cc: martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>
Subject: [PATCH v2] bpf: Document cfi_stubs and owner fields in struct bpf_struct_ops
Date: Fri, 21 Nov 2025 02:16:21 +0530
Message-ID: <20251120204620.59571-2-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <f87d1365-a3b6-4307-9d72-91d5f5b2c585@linux.dev>
References: <f87d1365-a3b6-4307-9d72-91d5f5b2c585@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing kernel-doc documentation for the cfi_stubs and owner
fields in struct bpf_struct_ops to fix the following warnings:

  Warning: include/linux/bpf.h:1931 struct member 'cfi_stubs' not
  described in 'bpf_struct_ops'
  Warning: include/linux/bpf.h:1931 struct member 'owner' not
  described in 'bpf_struct_ops'

The cfi_stubs field was added in commit 2cd3e3772e41 ("x86/cfi,bpf:
Fix bpf_struct_ops CFI") to provide CFI stub functions for trampolines,
and the owner field is used for module reference counting.

Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
Changes in v2:
- Removed documentation for non-existent fields (type, value_type, type_id,
  value_id) that were moved to bpf_struct_ops_desc in commit 4c5763ed996a

 include/linux/bpf.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index d808253f2e94..96851fa0494f 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1905,12 +1905,14 @@ struct btf_member;
  *	      reason, if this callback is not defined, the check is skipped as
  *	      the struct_ops map will have final verification performed in
  *	      @reg.
- * @type: BTF type.
- * @value_type: Value type.
+ * @cfi_stubs: Pointer to a structure of stub functions for CFI. These stubs
+ *	       provide the correct Control Flow Integrity hashes for the
+ *	       trampolines generated by BPF struct_ops.
+ * @owner: The module that owns this struct_ops. Used for module reference
+ *	   counting to ensure the module providing the struct_ops cannot be
+ *	   unloaded while in use.
  * @name: The name of the struct bpf_struct_ops object.
  * @func_models: Func models
- * @type_id: BTF type id.
- * @value_id: BTF value id.
  */
 struct bpf_struct_ops {
 	const struct bpf_verifier_ops *verifier_ops;
-- 
2.48.1

