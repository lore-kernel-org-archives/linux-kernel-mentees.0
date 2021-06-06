Return-Path: <SRS0=70AY=LA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B40C4743E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Jun 2021 19:48:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D25E61209
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Jun 2021 19:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D25E61209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4C7E40389;
	Sun,  6 Jun 2021 19:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iOhecAvCqtyl; Sun,  6 Jun 2021 19:48:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AB4440385;
	Sun,  6 Jun 2021 19:48:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C8DDC000D;
	Sun,  6 Jun 2021 19:48:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12588C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Jun 2021 19:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE96F606C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Jun 2021 19:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vjrDpy-FLXlz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Jun 2021 19:48:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92725605C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Jun 2021 19:48:04 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so8711532wmq.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 06 Jun 2021 12:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:to:from:message-id:in-reply-to:references:date:subject;
 bh=OIpSXB3BhBqM7WG4kTgHsq1B5qQdsWQ0yzQoTr+6Icc=;
 b=u1Z0c6gZnxM0mXRr2jatp7zUminq/g73Z87QEkezM8GZIEeXrVscLVTx5jfuQzgmNN
 3Li1uZebQVTMAleal6lxq8ORPrqj091DFJiP2TgEF08Kk4efHc573ng7cP+PYGBPsorJ
 ZIJjRfDVHoc3VVToVsIV5rRc4/SfjpBNFDLHO21IBTwL9UZIZwF+GJcfL+WG93cj2VJa
 QxHpqWCWtTCCZnLUMMHYM5+s3HBNof3EJZG7dTfDrkad2gzUJzGE9OEf8oSE0xjFuMnu
 w3/gatfleH5VmNZ02BP8Pq4EJBRuA5T6yzbSrKm6QGpMqqm7xrjIIbGmGOH1KpRbpTAT
 Tpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:to:from:message-id:in-reply-to:references
 :date:subject;
 bh=OIpSXB3BhBqM7WG4kTgHsq1B5qQdsWQ0yzQoTr+6Icc=;
 b=Km5cX9WDW6WVa0K0Vvfs11+o7G7wjtMlddYu1u4dc4bBqNaRH+SDlu3lmz5DrlYXiU
 Q4AKN/A1/4sCZ/uj27Jj3GGVSM/APcYJZXA2rAcYPV/i8ieSNh4E/EKPB8gBcIIkbuez
 AJJ06sFkvWz/qUy+tB6jKCv5tWcNrytZNoIjNJ61GuMN3yf6AxfO1mgZ8JyRlRR82dch
 o3G5X0I156WOVokKXXY7gIdIlCKU98N5d1alErG9krhNcWrj/e7YYLmER6rbdsg0RPNb
 bVZkfD4Bivfit4c13TpFawUXanGgLST/89oNSIrXkWkDwzfgK/H45wvJBXnA+jhEidCY
 UJIw==
X-Gm-Message-State: AOAM533UREO07RaOl+fpSnUYOyaA7Z3ju1aeJMZxJHr9VclXc7n6lAWL
 ZsjRft+zyW67FnLLlpQPN/A=
X-Google-Smtp-Source: ABdhPJxcHOFUElkPzZmqloOn5UweSlil7Up+Dj60LM0Cx2UTjdlMtNXAdyRaEb8veAADGMlglWevdA==
X-Received: by 2002:a05:600c:3789:: with SMTP id
 o9mr13854219wmr.78.1623008882702; 
 Sun, 06 Jun 2021 12:48:02 -0700 (PDT)
Received: from localhost ([185.199.80.151])
 by smtp.gmail.com with ESMTPSA id n8sm11662286wmi.16.2021.06.06.12.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 12:48:02 -0700 (PDT)
To: yhs@fb.com,
    alexei.starovoitov@gmail.com
From: "Kurt Manucredo" <fuzzybritches0@gmail.com>
Message-ID: <10175-15986-curtm@phaethon>
In-Reply-To: <f045d171-15ff-8755-bcb7-4e20ca79b28a@fb.com>
References: <000000000000c2987605be907e41@google.com>
 <20210602212726.7-1-fuzzybritches0@gmail.com>
 <YLhd8BL3HGItbXmx@kroah.com> <87609-531187-curtm@phaethon>
 <6a392b66-6f26-4532-d25f-6b09770ce366@fb.com>
 <CAADnVQKexxZQw0yK_7rmFOdaYabaFpi2EmF6RGs5bXvFHtUQaA@mail.gmail.com>
 <f045d171-15ff-8755-bcb7-4e20ca79b28a@fb.com>
Date: Sun, 06 Jun 2021 21:44:32 +0200
Subject: Re: [PATCH v4] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
Cc: nathan@kernel.org, songliubraving@fb.com, kafai@fb.com,
 syzbot+bed360704c521841c85d@syzkaller.appspotmail.com, hawk@kernel.org,
 daniel@iogearbox.net, linux-kernel@vger.kernel.org, john.fastabend@gmail.com,
 andrii@kernel.org, ast@kernel.org, syzkaller-bugs@googlegroups.com,
 clang-built-linux@googlegroups.com, ndesaulniers@google.com,
 netdev@vger.kernel.org, kpsingh@kernel.org, kuba@kernel.org,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, 5 Jun 2021 14:39:57 -0700, Yonghong Song <yhs@fb.com> wrote:
> 
> 
> 
> On 6/5/21 12:10 PM, Alexei Starovoitov wrote:
> > On Sat, Jun 5, 2021 at 10:55 AM Yonghong Song <yhs@fb.com> wrote:
> >>
> >>
> >>
> >> On 6/5/21 8:01 AM, Kurt Manucredo wrote:
> >>> Syzbot detects a shift-out-of-bounds in ___bpf_prog_run()
> >>> kernel/bpf/core.c:1414:2.
> >>
> >> This is not enough. We need more information on why this happens
> >> so we can judge whether the patch indeed fixed the issue.
> >>
> >>>
> >>> I propose: In adjust_scalar_min_max_vals() move boundary check up to avoid
> >>> missing them and return with error when detected.
> >>>
> >>> Reported-and-tested-by: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
> >>> Signed-off-by: Kurt Manucredo <fuzzybritches0@gmail.com>
> >>> ---
> >>>
> >>> https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231
> >>>
> >>> Changelog:
> >>> ----------
> >>> v4 - Fix shift-out-of-bounds in adjust_scalar_min_max_vals.
> >>>        Fix commit message.
> >>> v3 - Make it clearer what the fix is for.
> >>> v2 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
> >>>        check in check_alu_op() in verifier.c.
> >>> v1 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
> >>>        check in ___bpf_prog_run().
> >>>
> >>> thanks
> >>>
> >>> kind regards
> >>>
> >>> Kurt
> >>>
> >>>    kernel/bpf/verifier.c | 30 +++++++++---------------------
> >>>    1 file changed, 9 insertions(+), 21 deletions(-)
> >>>
> >>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> >>> index 94ba5163d4c5..ed0eecf20de5 100644
> >>> --- a/kernel/bpf/verifier.c
> >>> +++ b/kernel/bpf/verifier.c
> >>> @@ -7510,6 +7510,15 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
> >>>        u32_min_val = src_reg.u32_min_value;
> >>>        u32_max_val = src_reg.u32_max_value;
> >>>
> >>> +     if ((opcode == BPF_LSH || opcode == BPF_RSH || opcode == BPF_ARSH) &&
> >>> +                     umax_val >= insn_bitness) {
> >>> +             /* Shifts greater than 31 or 63 are undefined.
> >>> +              * This includes shifts by a negative number.
> >>> +              */
> >>> +             verbose(env, "invalid shift %lldn", umax_val);
> >>> +             return -EINVAL;
> >>> +     }
> >>
> >> I think your fix is good. I would like to move after
> > 
> > I suspect such change will break valid programs that do shift by register.
> 
> Oh yes, you are correct. We should guard it with src_known.
> But this should be extremely rare with explicit shifting amount being
> greater than 31/64 and if it is the case, the compiler will has a
> warning.
> 
> > 
> >> the following code though:
> >>
> >>           if (!src_known &&
> >>               opcode != BPF_ADD && opcode != BPF_SUB && opcode != BPF_AND) {
> >>                   __mark_reg_unknown(env, dst_reg);
> >>                   return 0;
> >>           }
> >>
> >>> +
> >>>        if (alu32) {
> >>>                src_known = tnum_subreg_is_const(src_reg.var_off);
> >>>                if ((src_known &&
> >>> @@ -7592,39 +7601,18 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
> >>>                scalar_min_max_xor(dst_reg, &src_reg);
> >>>                break;
> >>>        case BPF_LSH:
> >>> -             if (umax_val >= insn_bitness) {
> >>> -                     /* Shifts greater than 31 or 63 are undefined.
> >>> -                      * This includes shifts by a negative number.
> >>> -                      */
> >>> -                     mark_reg_unknown(env, regs, insn->dst_reg);
> >>> -                     break;
> >>> -             }
> >>
> >> I think this is what happens. For the above case, we simply
> >> marks the dst reg as unknown and didn't fail verification.
> >> So later on at runtime, the shift optimization will have wrong
> >> shift value (> 31/64). Please correct me if this is not right
> >> analysis. As I mentioned in the early please write detailed
> >> analysis in commit log.
> > 
> > The large shift is not wrong. It's just undefined.
> > syzbot has to ignore such cases.
> 
> Agree. This makes sense.

Thanks for your input. If you find I should look closer into this bug
just let me know. I'd love to help. If not it's fine, too. :-)

kind regards,

Kurt Manucredo
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
