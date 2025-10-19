Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B14220FA81
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Oct 2025 22:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760913036; cv=none; b=MDK1zGMWjTQWcmpB4KQ4Se4GqdbZjaFdGfJTY1mcfGb1iBWFov83zI7zeczGzh7FLqzomAg/woSaW7YDuhFTVg7Vr20Rkd4xUCIGMjagN42RitvgyoOkXyyTGxiyhWaNQ7/Kyaav/i/zf3Y67IBeZZHXpJLjxHd/e+KAPx7MF0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760913036; c=relaxed/simple;
	bh=1VyNDB02vhSBB7FEJy9+MvvYx7rYtvfZUUI8FZN4GJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Prle4shSIPs5JoF+vQcFAHXxFpe/+67tjd7st7n1/kjc2e+dQW7EMo4OECWPy+j9PB8p2u4yuE9Zn37gbKqWcC36PZZSzrV4BoSS3Gi1OiWv9tfERZhEhAlkQdGqIdLjH20HBQU9l7IZJrFbomyDk5nLHGM4595BT7uAtPOqkBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvvA2GPp; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvvA2GPp"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-78125ed4052so4656349b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Oct 2025 15:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760913034; x=1761517834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ln/mU8zYFji5KHoiExwHL0rc07J4kGX/OgUlOJfH7cY=;
        b=OvvA2GPpCltYsp3KMWPR/EhFaDBKxOOafYC+cJlhVw7DIfPm6BRuZPyUDrcjmocqSv
         vEuBt1HzPUPuLBGc/jbXSklI+QqbFfyaYztZtBbEvCYGy/fJDYjxDrSDS8m4OMEsk3f2
         j/2Zhyf/ya1T/GIgDIuoLfsC8RLDP3IEP5ZihfbI/sHHnBErY/SkIXvIcYK+e+XqnyQe
         QJYYef4Jd71SpRB0KqGq81ens6NHFBskC9BVLPQFBOArUao50rDxSQjDGYn6/E7UOj/m
         7IKNLX369BsqPlyCuXwM2zESKp8RLUQy1ah96NzJnF63ktXVyMhjQznmr4AhdTRiz6Vq
         BAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760913034; x=1761517834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ln/mU8zYFji5KHoiExwHL0rc07J4kGX/OgUlOJfH7cY=;
        b=uPlxEhkBlbITJ262Jz2HDKeUZl08mZb6sM02bzBTNZ7fKaKjxdjWu+7J1KgCdAVm9Z
         QB8Cc95zwhBOPtJOvJr/YHZqXGAv454onEV2mMF84HoNwNALNFu1F40fIcfMkCkO+0UZ
         r1dqyOHsbzXneAtVHpeQBB04qeXWN4Y09+KGfOhu1AO1bzzQUkDM9Ba9Uv55DTFsSmAc
         KhwKKoiSc94PNScUB6Zp2xKN99sX9CRlA7nQ9HQ2d+a22tHKJgUlu/LzeqffbmHpInKr
         IziFkDb5wMcZwkjfJD4I8hK+iAdTpXVz6JZBKi2SiaKcGEhwGFEdRtofIdp2shYLlmGZ
         bxtw==
X-Forwarded-Encrypted: i=1; AJvYcCXAM+3t9dnEM5d4jrFECqz7yqqV8nH+no+WNqXYO/r/llI6K8C2KKa/EIHEmHGJ5jFy2reDYTAcMH9N6C3O/yLnl2nwbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzArWsqY74WL9XbyLA+hp8E/0rOvWmDrOv3eWicHSIJ2iK/eEnM
	K/maRTXRs4W3gikTPDxSNoZ5UkabxM6iRx//2ljIgHwbJwmmb270MMiO
X-Gm-Gg: ASbGncu5JYWwjURMRxEKPUeqPtIdZdYdh+X0P1Uho2XcThGmheDb0zOmHG5ldQklqsu
	Eu/AaFKasdNQLDsznqYZx3k635z1EFdT2HXFlEC8c8FeTKhfQ0307eHlq0JyNNmRch+8D9rfbSm
	+CEQPaXoSle8JBy+fv80jICm5MR5lAqAOUkdnIJhpdnWL5wQZM1IBBBriO9nJeboHuF8OHvNW9v
	3jqyzAgHduqMJ7CVtnq8CRGeeQJL1BhWt5AccNi0e0b+Z7uglgdDi5tSEeY3PP49KL4tH/UeUE5
	RqqOiWVP0VO9CqzvJZWUzfzxegQfMULHbsD53OoRRdzZFjkFrJMA+h6/JvwBlmTuZ2i8B4JevX4
	aELqinOzOf5ZSuFKsExTDx/5TSLAI/gGiPG8LPKLw/T002+YOeEEtFchv48Bm8aIOEsokYsAO
X-Google-Smtp-Source: AGHT+IGnF5Srcir7/6CWxen50eglfngyYXHZEDVZiPbz8BkFINxUwaCDRPwDVsgdeNlWE25tkflYZA==
X-Received: by 2002:a05:6a20:6a1b:b0:319:fc6f:8adf with SMTP id adf61e73a8af0-334a85340b4mr14174653637.12.1760913034079;
        Sun, 19 Oct 2025 15:30:34 -0700 (PDT)
Received: from fedora ([45.112.145.73])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76645c61sm6317715a12.3.2025.10.19.15.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 15:30:33 -0700 (PDT)
From: Noorain Eqbal <nooraineqbal@gmail.com>
To: alexei.starovoitov@gmail.com
Cc: andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	david.hunter@linuxfoundation.org,
	eddyz87@gmail.com,
	haoluo@google.com,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin.lau@linux.dev,
	nooraineqbal@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	song@kernel.org,
	syzbot+2617fc732430968b45d2@syzkaller.appspotmail.com,
	yonghong.song@linux.dev
Subject: Re: [PATCH] bpf: sync pending IRQ work before freeing ring buffer
Date: Mon, 20 Oct 2025 04:00:06 +0530
Message-ID: <20251019223006.26252-1-nooraineqbal@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAADnVQ+pXhEsumx6NapCU0sCJw9vdB3TdLMLtCoHa7_sqCRH1A@mail.gmail.com>
References: <CAADnVQ+pXhEsumx6NapCU0sCJw9vdB3TdLMLtCoHa7_sqCRH1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 19, 2025 at 1:13 UTC, Alexei Starovoitov wrote:
> Why do you think irq_work_run_list() processes bpf ringbuf in
> the above splat?

In the syzbot reproducer, GDB shows that when bpf_ringbuf_free() is entered 
the ring buffer's irq_work was still pending when the map was being freed.

    (gdb) p rb->work
    $5 = {
      node = {llist = {next = 0xffffffff8dc055c0 <wake_up_kfence_timer_work>},
              {u_flags = 35, a_flags = {counter = 35}}},
      func = 0xffffffff8223ac60 <bpf_ringbuf_notify>,
      irqwait = {task = 0x0}
    }

Here, `u_flags = 0x23` indicates IRQ_WORK_PENDING and IRQ_WORK_BUSY
are set, which shows that irq_work for the ring buffer was still queued
at the time of free. This confirms that `irq_work_run_list()` could
process the ring buffer after memory was freed.

On Sat, Oct 19, 2025 at 1:13 UTC, Alexei Starovoitov wrote:
> Sort-of kind-of makes sense, but bpf_ringbuf_free() is called
> when no references to bpf map are left. User space and bpf progs
> are not using it anymore, so irq_work callbacks should have completed
> long ago.

You're correct that normally all irq_work callbacks should have completed
by the time bpf_ringbuf_free() is called. However, there is a small
race window. In the syzbot reproducer (https://syzkaller.appspot.com/text?tag=ReproC&x=17a24b34580000),
the BPF program is attached to sched_switch and it also writes to the
ring buffer on every context switch. Each forked child creates the
BPF program and quickly drops the last reference after bpf_ringbuf_commit()
queues an irq_work. Because the irq_work runs asynchronously, it may still
be pending when bpf_ringbuf_free() executes, thus creating a small race
window that can lead to use-after-free.

Adding `irq_work_sync(&rb->work)` ensures that all pending notifications
complete before freeing the buffer.

Thanks,
Noorain Eqbal
