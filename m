Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426441;
	b=B5/JJy0RK6MOFS77km6Jg05ETrcnivzhAL45SiHF7DnpLBezf2IbPrPlBGPfVPFyxUkr
	 qDOTZijYhiI+miDuLlxZFVRvptsCDXygTl4XQtiN+cWqsMVU+1wpHXoyrrwIUtuz3H7eP
	 18IKHuDherACZw3g1YBXxNSyZAIFya5od1i71WUooEWUmYGkP9zmmIoHh1EGP9xgnflig
	 pxMVaSytG032NFgACJjoSuAcNQOKqtXNSrS72HHJByj0QYDq6kJ6I+hUHCiA2G1BJYsr5
	 Y+AS5+qi61gR49Nqe8/imHwbnUzrm2NDHpiPkp3RGZjlAmXLwPrva+mx/ECvTyLf8lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wE8DD8N71MQfznU3Ft9s/Hf8dnnaSHV9fDu9XrNDJAk=;
	b=tr8zbR9eML6aoZoLDHAh7nvvo7JYVZfxzA5joxI+fpC9HLl+mGOkGAw/EnhcgRttjeJW
	 dSPKpIyFRVB3RERqSz5kHegTOyfApWKzjNX6OvC7B3n0BdbC92iDLIOAMZ30VQdjKBRQn
	 xqlciMmO18mrZRt4PkgY5OkeGOuUAgECgo8sFLu7NJGWmXgRiPw4cq/9CZkTu3CeR9wq9
	 7CbgcGCQqHeBN1WucBNKyfN6RaDFzdmvOqjmNx087NUFnwm+SFbTkWm4DsRY4DJTZBrIA
	 Prd72KrKIYpXEUhmW8IxZrXQXmNrOSE+KnqszBVj1AE8Z98NBcnTlZAz93cucv1Ht6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KiGBCEIC;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E0F606A33D
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 Oct 2026 16:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E0F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KiGBCEIC
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7cc013095d4so686183137.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 Oct 2026 09:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426439; x=1793031239; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wE8DD8N71MQfznU3Ft9s/Hf8dnnaSHV9fDu9XrNDJAk=;
        b=KiGBCEICckHzNoWr3tD9YtBbCP/2Pfg9liboB+MMwTH0lu0l67gKUi2Z/KcNvARHgO
         otGUzaHcRpHw/LdBfyabn9KliBgdh/uOxcSat9bINC6ooUAqscGNsgM+QovHfv1RRP6d
         OPjJ6VigH112daeGyqoCH4loA/L0zt4HELTzWusETdI8EnkDWDki4q2Osqy5IJyMeycd
         9VkFNAgpSRZzO5Uonw9PyE8em+kPy9uUkNEYeot9RuLJth6bhNK/Hj0NytSyBb2STtxr
         fYBRtsgFE5oipaK9sLmgyJIc59Cx++2ipXG6QQpL0mLgKdSL30GKo68w7rP8CRrYq0XR
         3qGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426439; x=1793031239;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wE8DD8N71MQfznU3Ft9s/Hf8dnnaSHV9fDu9XrNDJAk=;
        b=rPJxzmtYwmuAjcw2OLDDRmk5FJbq3nN/F32w1Wz8SgEeFiMCeg9yqRIVWFAiGbvcjx
         jYRS8QhHQszXF1HCLHOx26zbWlnNpOj974uGkhrhPvyZ6pS6pe57wP1IoCG5xF4Ff4L4
         /60XB/zlHW+4pGrjdoadGp5O9iXZh5AjGBF4aRJbGDpNY3QqfZBD8mZ+i11WKRcMXjhh
         8HJa+AWaEcXr++W+aQriRICtq7iSVlL50gTM6I7oCNFgQrBjWg8asjVizruvYssi/y4+
         opSl6EwAOSjh68AEvFVrBrLiqnCJfwk/nwmubrdq7r19olmTzNKSqwYJE9rNlfkKigPF
         jXKg==
X-Forwarded-Encrypted: i=1; AKwUvBwP2p3Zf2Ed0SDTv4z+QqQo2stoSf7pwW28K7iGaZd+oPnoEiVsFnMJoYX8x1s/3cIfqP+3Gib4rw+BzKNn5+4Uu+7IvA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKwuF1KNzP9K/ulCjMH8jbfzDJvP8GQkhYFR5l9hsHoytqLhMU+
	ab9WBLJTmgmWDEqbOCzMPDtXiw7x+Rr7pHNzs1mtZcYh9Dd4HmsUMVQ=
X-Gm-Gg: AYBFou2pNVvLymALIOCn1FICv5h1M6+rBZfTuI4gUTIqdb/uZN8MFtkmL96N7msYrGK
	diwGYnUDD8kvQFy0z7HAzFrL+gw66D+3WW+/CFY2JT0bnO5/0DmM7/xsyqtWTiPUiapPIAUGuwT
	K4lP/zoKtJG33KAfOMdf0AUlodMgU4XDlXv9q8LXII4sToLRHzvM4ffYI9GCKRNkuk2N5hKTPJz
	aS5oX0/s8enjDLzFDw3dRkBvJjyHm5a1jPoNdL4usG3llLIZnlaf4TVk7fzKvlnULstdBwLxoim
	3ibcg6SpdMJ/m+Wxm22/n/kyV+InPRriXeqYr0dKFu7xgki0Z+Szc2YdRgUEzFAHQvb966yx0WH
	WDym/+0dDObusUGIEs5IcRPLbwAH9qKV0FBrLGTjsninddEQTkjq683IZcA/8H1wvnA3eRZuH0f
	oFdBAD82kMMc+qwe7zL1EyvjKd+JMvHv0zCklk6wKO1fdyMHyTrSeM5E8i49X5sNKpXv6D43iQc
	bXVqD1NROTPZnwRXxqC7465SYlqzDPi2UHrdjuFIxPsV55G/g==
X-Received: by 2002:a05:6102:5113:b0:7cb:bc5e:7dad with SMTP id ada2fe7eead31-7cc368f6cdemr2108176137.10.1792426438620;
        Mon, 19 Oct 2026 09:13:58 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb38f7f1sm525062241.10.2026.10.19.09.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:13:57 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 0/2] remove TryFrom<&Device> implementation for pci and platform
Date: Mon, 19 Oct 2026 13:13:36 -0300
Message-ID: <cover.1792417858.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This patch series removes `TryFrom<&Device<Ctx>>` implementations for
pci and platform's `Device` struct.

To make sure that there were no remaining users, I checked for usages of
the `try_from` method and the structs implementing `TryFrom` using rust
analyzer, activated the modules that were using the structs, removed the
implementation and compiled the kernel (did not trust entirely in rust
analyzer because it does not find usages that depend on this
implementation like the `try_into()` in fact, the last usage of the
trait was a `try_into()` in pci).

I did what I described above from the most recent changes (rust-next,
linux-next, drm-rust-next) down to the introduction of the
implementation, stopping in all major versions (7.3-rc7 to 6.19) to find
the last usage and mark the commit in the `Fixes:` tag. I found no
usages for the platform implementation.

If applied to current rust-next, commit 7c306f00835a ("rust: zerocopy:
update to v0.8.62"), nova driver will fail to build, drm-rust-next and
linux-next are ok.

This series, along with the i2c patch [1], closes:
https://github.com/Rust-for-Linux/linux/issues/1264

I made this a series because both TryFrom implementations were
introduced in a series:
https://lore.kernel.org/all/20250321214826.140946-1-dakr@kernel.org/

[1] https://lore.kernel.org/rust-for-linux/20261019152329.620610-1-nico.antinori.7@gmail.com/T/#u

Best regards,
Nicolás

Nicolás Antinori (2):
  rust: pci: remove TryFrom<&Device> implementation for &pci::Device
  rust: platform: remove TryFrom<&Device> implementation for
    &platform::Device

 rust/kernel/pci.rs      | 21 ---------------------
 rust/kernel/platform.rs | 21 ---------------------
 2 files changed, 42 deletions(-)

--
2.47.3

