Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844F532827B
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Nov 2025 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762874030; cv=none; b=fp0dNcyKIa0MfyBUo9CoRObb/j81Xr68ZKL6+x/I1Tk0HuYT58hOCJ2ewKh6UlnLRdLrcWWOKMtJvZtwQq34a8JeTtHcsaz7hwyEMA6cENzf1uqqhKXjJRKW+7sJbkaoQF6KBDPG7IEH9rT5ZLBZO0EbUqqdOyqT86LMw5h9LSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762874030; c=relaxed/simple;
	bh=haGuT6duQiD/g2QeFQRAKJR7i+myTnoI1eybJrl1N1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hzOYCHzmU2dIdSumC0gc1XDyD8Gctmk+k+87eUPoYsUNgr416T4dWkRHDN+VCb0e+3m0fN5aYssQV1TypT2q3HhU+pj1ipNd8empqDSi9nXuqa41mTeO/LijxgVJW5nyEoNQajk049wzx2znFxUwykByO7EVr46nvWLpe10NAAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuTidoSX; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuTidoSX"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b9f1d0126e6so680923a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Nov 2025 07:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762874029; x=1763478829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41cP7HhdYBF0wKzXmJRqSWi2C2B06MZQG6yQgaUNwsI=;
        b=UuTidoSXxj3Uv/vm+o38O5/xfahpWuQqfdUpiOBgLdLRAWA/DRRv/+mkND0lsw1oA3
         fA+26qA5dN1SBM8+SKqVXs6hRBVYbuzD+YRTMZJDHpv5y3fQYiCcq376hRGW17dDzZcx
         jyXuicKu0ZQczPWiCgTT/LiZ+cuY/CNv9DxUkX7RksiUckXR3H0YStohG7AaCboHMwfV
         cEZbWvdAHA/IQ5EPGUA/U9kPIi7ZVWULT+F9H6s7wESt68sQ8Jri26laBDJeiyVJ7u5l
         nlt/2vPPZiKA5LVEtd7z4F+FgG3TIZZ9QU6LD6HXigT7SUXOGaxRMy+h9cFj0iwx3dgS
         QR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762874029; x=1763478829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=41cP7HhdYBF0wKzXmJRqSWi2C2B06MZQG6yQgaUNwsI=;
        b=GD+irg7fWHnnGmSmAhEI0PxqRLI3C67kty4089B/Y4c3n2MEpyTeqmHKVlVyHg6B5I
         bujqMtATVE3gHns9DLj6ciUtSXxcYVMzogiP74rupRoUoZkq9o9xW71GexzNCVEbDejn
         8mlJSZi7TLgENkNcVJqUzr56Wt/elYWRg2+VoKWBXlYVawwHi8xQR6wAnDP1ni54ZVqd
         PObY3y67yK3Ff8eML61gzac+Xol/ZW1ryjLIU/EIPoEtWnObat10C+u6oAapU1iHC+Wz
         Qrazmq5xYo1VFCWHZ5Af0Gpw3pf1w5P6PxJ3uwP3VaHVU6hW08qf9TCB/hc0f1ys123Q
         wg4g==
X-Forwarded-Encrypted: i=1; AJvYcCXhxKOW9LZ1hkcXHLwUZrK7sygOdE/uwhlbNX675iElavzAwneE0832U55YyIn4m/TVSGDtQXrV37LCNB13QqBNLqCzvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxDm38dH3YsNy71ZRTLmIsjPX0aErtBCOIXHI3XLM5Sv3bwMlI
	19e8VpXDnJXjrKYmnJiLyP6Z4Ui9HE9pGScBZz9fekJsDerhSE3dSkfn
X-Gm-Gg: ASbGncs+BJT7lVF9CbvrNmUiUd+XH/d3mkhqWvP4Kf3LdqyvDlvdI+YiNK/WX4L3msx
	snn6M9gAfvwn0oxCuRCC34mIRLm6a/EIw4mJt1ss1k3O+vgiPBuFN9R3eJ/zbs90xhR+qtWLJIi
	BB+pwTikJIQ6SoHaHxwdxZijoqnaI+mVmySp1yU4poXqgdVvro2YtNerl0kQkb9j/4lXoCgCYDv
	9jQpHF6HG/demw47MuTILV2RcYr7YH9x0ynofY7E4vSHzMIbbo6uPl4wCCvHrG5OVLLfVkKuN0E
	phQH6S58t1sDwvYZj38iaBNly+FmP2/Ds2oYNOZkMlHgAMXDu5CZd38vyNOIxMFzWt47Z16HRfl
	EczLtDW0nBKThdadGBHYQE0nWvS0QMNfBYf1MzHdW6AnhGyucVX8G5dHawHT5N/DVriV/1DX8j3
	wE6DGa2V5l2Gbli3KN4oWpMB48PX44JN4ge3PKrgilUcUAOg==
X-Google-Smtp-Source: AGHT+IFTK5kIozJ8wfyxlroJjlHKYrJMVtPSJw+tmo3xM6ic8/B2Xj64K9YTLD2mUTD5Z6Wt9lW4/A==
X-Received: by 2002:a17:902:ef4f:b0:295:134:9ae5 with SMTP id d9443c01a7336-2984083ab27mr46536345ad.24.1762874028798;
        Tue, 11 Nov 2025 07:13:48 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd050asm43325ad.81.2025.11.11.07.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:13:48 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	clintbgeorge@gmail.com,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v2 0/3] hangcheck-timer: coding style improvements
Date: Tue, 11 Nov 2025 20:43:37 +0530
Message-ID: <20251111151340.9162-1-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025110649-elves-steadying-a4d0@gregkh>
References: <2025110649-elves-steadying-a4d0@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves coding style in hangcheck-timer:

Clint George (3):
  hangcheck-timer: replace printk(KERN_CRIT) with pr_crit
  hangcheck-timer: Replace %Ld with %lld
  hangcheck-timer: fix coding style spacing

No functional changes were made to hangcheck logic.

Signed-off-by: Clint George <clintbgeorge@gmail.com>

---

Testing:
- Verified timer firing and margin detection using "hangtest" module that
i created (I will paste the code below for reference) and checked dmesg
logs for expected output: "Hangcheck: hangcheck value past margin!".
- Used Static Analysis tools
- Ensured module builds and inserts cleanly after changes.

Let me know any more tests need to be done on this module.

[] hangtest.c (testing module i created to test hangcheck-timer module):

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Clint George");
MODULE_DESCRIPTION("Hang test for testing hangcheck-timer");

static int hang_duration = 20;
module_param(hang_duration, int, 0644);

static int __init hangtest_init(void) {
    unsigned long timeout;

    printk(KERN_INFO "hangtest: Disabling interrupts for %d seconds...\n", hang_duration);

    local_irq_disable();
    preempt_disable();

    timeout = jiffies + (hang_duration * HZ);
    while (time_before(jiffies, timeout)) {
        cpu_relax();
        barrier();
    }

    preempt_enable();
    local_irq_enable();

    printk(KERN_INFO "hangtest: Interrupts re-enabled\n");
//    return 0;
    return -EINVAL; // Return error so module doesn't stay loaded
}

static void __exit hangtest_exit(void) {
    printk(KERN_INFO "hangtest: Exit\n");
}

module_init(hangtest_init);
module_exit(hangtest_exit);

 drivers/char/hangcheck-timer.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

-- 
2.43.0

