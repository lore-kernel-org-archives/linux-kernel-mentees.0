Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8C8C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 13:47:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2417207F7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 13:47:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeEN53YN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2417207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4D60286AB6;
	Thu,  1 Oct 2020 13:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjVOIGMTZuhE; Thu,  1 Oct 2020 13:47:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BCBA786AC1;
	Thu,  1 Oct 2020 13:47:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8051C016F;
	Thu,  1 Oct 2020 13:47:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBEB2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A73BD86839
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dF+WCIy-a4RB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:47:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B866385700
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:47:27 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d13so4074685pgl.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KLxhCBxsUkb5A/q0T03a7JDkmErT1qDzOj8Kq6wGtLk=;
 b=OeEN53YNeJMbv6mtawkl7yKjvkl0fTnbmSyRyo3jPPgIVkfeQmwUNk84HFDLWCrf1F
 85Vl7cBdlwQhnlCsP36JSeojsxg6ASL/nof0ULMlCwzg+g4K9Zc7GRXzmY0B4UhrWKlz
 iCxek4bxgo8h4cukUh3jpFGRhyXYzK0SoASlflUWMlaezde4oW8oiY5c996JRveI5qyR
 6MVnsZaiwQ50bq63jtJIAVaw/+gbhZvMDNhkpOI5Bo1XFGCfgDYI1YmgB3gKoluoWNzH
 LxOorVhAqO9bD//q6UHM8UUb1+5tuK84YQCucRpSUpiGUr8cHKGuhyZALXOHXrFSWWpu
 uuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KLxhCBxsUkb5A/q0T03a7JDkmErT1qDzOj8Kq6wGtLk=;
 b=XYE5D1ulZxFiVySLcvf5TI8l5PjtVoYVKljVVEOegnXcCz+4ks3tfA4sNdRw6YRZHB
 t8XSwMOhbanXVnSSpAHaghicufaFE8kj/JwvtWe+2/Cgr1ZFmiRwnJeHWbUeom5+1joj
 hqMPrur6UyDhpE+csFbDu+f7LDPPjhIuuBhA/ZLzo8TB95VDsxeScYCtQsLY4OgOwy8b
 GprLF5RocSU4h9cwguiVscj/O1kC+a5ldpsNl8OPfaSkMDGy2aaO/s91opMeX3wSTWh0
 eCdVA29XBUUPi4LBa5EvY7a7AwbudxbPa0uiSkCclonmjY7rOnMQ/jHtohYoS4+54g6O
 JIGQ==
X-Gm-Message-State: AOAM5327QZxXvoyc6xsvtDsM+uWKGkXa5UBX1t03jPpcMk62OOQPudvE
 YRWfEWN66j8peK5gCBNnU351XF1t6+TDSg==
X-Google-Smtp-Source: ABdhPJw4zvp5+7fg7G7vI7CZGLe1d9rinSIuI4zCiHrFSkqEMPbRBhVn/74t6mTyIjsi0ZeARVREdA==
X-Received: by 2002:aa7:8885:0:b029:142:2501:39ea with SMTP id
 z5-20020aa788850000b0290142250139eamr7035032pfe.57.1601560046534; 
 Thu, 01 Oct 2020 06:47:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id l11sm33358pjf.17.2020.10.01.06.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 06:47:25 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <61d45592-20be-7fe1-8168-5ccacca655a3@gmail.com>
 <alpine.DEB.2.21.2010011245490.24571@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <80f188d8-b0c2-ecf1-d0b9-faad146d2cec@gmail.com>
Date: Thu, 1 Oct 2020 19:17:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010011245490.24571@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] kbuild: use interpreters to
	invoke scripts
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 01/10/20 4:38 pm, Lukas Bulwahn wrote:
> 
> 
> On Thu, 1 Oct 2020, Ujjwal Kumar wrote:
> 
>> We cannot rely on execute bits to be set on files in the repository.
>> The build script should use the explicit interpreter when invoking any
>> script from the repository.
>>
>> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
>> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
>>
>> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
>> Suggested-by: Kees Cook <keescook@chromium.org>
>> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
>> ---
>>  Documentation/Makefile                           | 16 ++++++++--------
>>  Documentation/userspace-api/media/Makefile       |  6 +++---
>>  Makefile                                         |  4 ++--
>>  arch/arm64/kernel/vdso/Makefile                  |  2 +-
>>  arch/arm64/kernel/vdso32/Makefile                |  2 +-
>>  arch/ia64/Makefile                               |  4 ++--
>>  arch/nds32/kernel/vdso/Makefile                  |  2 +-
>>  .../comedi/drivers/ni_routing/tools/Makefile     |  6 +++---
>>  scripts/Makefile.build                           |  2 +-
>>  scripts/Makefile.package                         |  4 ++--
>>  tools/bootconfig/Makefile                        |  2 +-
>>  tools/bpf/Makefile.helpers                       |  2 +-
>>  tools/lib/bpf/Makefile                           |  2 +-
>>  tools/perf/Makefile.perf                         |  2 +-
>>  tools/power/cpupower/Makefile                    |  2 +-
>>  tools/testing/selftests/rcutorture/Makefile      |  2 +-
>>  tools/testing/selftests/rseq/Makefile            |  2 +-
>>  tools/testing/selftests/vm/Makefile              |  6 +++---
>>  tools/testing/selftests/wireguard/qemu/Makefile  |  4 ++--
>>  tools/testing/selftests/x86/Makefile             |  6 +++---
>>  20 files changed, 39 insertions(+), 39 deletions(-)
>>
> 
> You will probably need to split this patch into multiple patches, but the 
> discussion will show how to split it best.
> 
> Probably:
> 
>  - one for Documentation
>  - one for general kbuild, maybe including arch
>  - one for selftests
>  - one for the other tools
>  - one for the comedi driver
> 
> So, what did you do for testing your change?

First, I had to unset the execute bits on all files.
for i in $(find -executable -type f); do chmod -x $i; done

To test the changes, I invoked the make rule under which my current 
changes lie. And I could see a permission-denied whenever a script 
was invoked. After the patch, the make rule progressed without 
any permissions error.
I couldn't test each and every change, because some rules failed 
before invoking the script and others could not be invoked by me.

I successfully tested the changes under Documentation/ (and some others).

$ make htmldocs
make[1]: execvp: ./scripts/sphinx-pre-install: Permission denied
make[1]: *** [Documentation/Makefile:81: htmldocs] Error 127
make: *** [Makefile:1661: htmldocs] Error 2

Files that I tested my changes on:
Documentation/Makefile                           | 16 ++++++++--------
Documentation/userspace-api/media/Makefile       |  6 +++---
Makefile                                         |  4 ++--
tools/perf/Makefile.perf                         |  2 +-
tools/power/cpupower/Makefile                    |  2 +-


> 
> Did you check if CONFIG_SHELL is actually available in tools?

Yes, I did check.
To verify, I echo(ed) the variables under a make task. And invoked 
the task from srctree.

> 
> 
>> diff --git a/Documentation/Makefile b/Documentation/Makefile
>> index 6b12dd82f712..e74315074336 100644
>> --- a/Documentation/Makefile
>> +++ b/Documentation/Makefile
>> @@ -7,7 +7,7 @@ subdir- := devicetree/bindings
>>  
>>  # Check for broken documentation file references
>>  ifeq ($(CONFIG_WARN_MISSING_DOCUMENTS),y)
>> -$(shell $(srctree)/scripts/documentation-file-ref-check --warn)
>> +$(shell $(PERL) $(srctree)/scripts/documentation-file-ref-check --warn)
> 
> I guess you can drop shell, if you have added $(PERL).
> 
>>  endif
>>  
>>  # You can set these variables from the command line.
>> @@ -29,7 +29,7 @@ ifeq ($(HAVE_SPHINX),0)
>>  .DEFAULT:
>>  	$(warning The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed and in PATH, or set the SPHINXBUILD make variable to point to the full path of the '$(SPHINXBUILD)' executable.)
>>  	@echo
>> -	@$(srctree)/scripts/sphinx-pre-install
>> +	@$(PERL) $(srctree)/scripts/sphinx-pre-install
>>  	@echo "  SKIP    Sphinx $@ target."
>>  
>>  else # HAVE_SPHINX
>> @@ -78,14 +78,14 @@ quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
>>  	$(abspath $(BUILDDIR)/$3/$4)
>>  
>>  htmldocs:
>> -	@$(srctree)/scripts/sphinx-pre-install --version-check
>> +	@$(PERL) $(srctree)/scripts/sphinx-pre-install --version-check
>>  	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
>>  
>>  linkcheckdocs:
>>  	@$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,linkcheck,$(var),,$(var)))
>>  
>>  latexdocs:
>> -	@$(srctree)/scripts/sphinx-pre-install --version-check
>> +	@$(PERL) $(srctree)/scripts/sphinx-pre-install --version-check
>>  	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,latex,$(var),latex,$(var)))
>>  
>>  ifeq ($(HAVE_PDFLATEX),0)
>> @@ -97,7 +97,7 @@ pdfdocs:
>>  else # HAVE_PDFLATEX
>>  
>>  pdfdocs: latexdocs
>> -	@$(srctree)/scripts/sphinx-pre-install --version-check
>> +	@$(PERL) $(srctree)/scripts/sphinx-pre-install --version-check
>>  	$(foreach var,$(SPHINXDIRS), \
>>  	   $(MAKE) PDFLATEX="$(PDFLATEX)" LATEXOPTS="$(LATEXOPTS)" -C $(BUILDDIR)/$(var)/latex || exit; \
>>  	   mkdir -p $(BUILDDIR)/$(var)/pdf; \
>> @@ -107,11 +107,11 @@ pdfdocs: latexdocs
>>  endif # HAVE_PDFLATEX
>>  
>>  epubdocs:
>> -	@$(srctree)/scripts/sphinx-pre-install --version-check
>> +	@$(PERL) $(srctree)/scripts/sphinx-pre-install --version-check
>>  	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,epub,$(var),epub,$(var)))
>>  
>>  xmldocs:
>> -	@$(srctree)/scripts/sphinx-pre-install --version-check
>> +	@$(PERL) $(srctree)/scripts/sphinx-pre-install --version-check
>>  	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,xml,$(var),xml,$(var)))
>>  
>>  endif # HAVE_SPHINX
>> @@ -120,7 +120,7 @@ endif # HAVE_SPHINX
>>  # work or silently pass without Sphinx.
>>  
>>  refcheckdocs:
>> -	$(Q)cd $(srctree);scripts/documentation-file-ref-check
>> +	$(Q)cd $(srctree);$(PERL) scripts/documentation-file-ref-check
>>  
>>  cleandocs:
>>  	$(Q)rm -rf $(BUILDDIR)
>> diff --git a/Documentation/userspace-api/media/Makefile b/Documentation/userspace-api/media/Makefile
>> index 81a4a1a53bce..5919b3e749fe 100644
>> --- a/Documentation/userspace-api/media/Makefile
>> +++ b/Documentation/userspace-api/media/Makefile
>> @@ -13,11 +13,11 @@ FILES = audio.h.rst ca.h.rst dmx.h.rst frontend.h.rst net.h.rst video.h.rst \
>>  TARGETS := $(addprefix $(BUILDDIR)/, $(FILES))
>>  
>>  gen_rst = \
>> -	echo ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions; \
>> -	${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
>> +	echo $(PERL) ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions; \
>> +	$(PERL) ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
>>  
>>  quiet_gen_rst = echo '  PARSE   $(patsubst $(srctree)/%,%,$<)'; \
>> -	${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
>> +	$(PERL) ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
>>  
>>  silent_gen_rst = ${gen_rst}
>>  
>> diff --git a/Makefile b/Makefile
>> index f93dbae71248..5f1399a576d4 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1258,7 +1258,7 @@ include/generated/utsrelease.h: include/config/kernel.release FORCE
>>  PHONY += headerdep
>>  headerdep:
>>  	$(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
>> -	$(srctree)/scripts/headerdep.pl -I$(srctree)/include
>> +	$(PERL) $(srctree)/scripts/headerdep.pl -I$(srctree)/include
>>  
>>  # ---------------------------------------------------------------------------
>>  # Kernel headers
>> @@ -1314,7 +1314,7 @@ PHONY += kselftest-merge
>>  kselftest-merge:
>>  	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
>>  	$(Q)find $(srctree)/tools/testing/selftests -name config | \
>> -		xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
>> +		xargs $(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
>>  	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>>  
>>  # ---------------------------------------------------------------------------
>> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
>> index de981f7b4546..30fe93bb5488 100644
>> --- a/arch/arm64/kernel/vdso/Makefile
>> +++ b/arch/arm64/kernel/vdso/Makefile
>> @@ -65,7 +65,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>>  # Generate VDSO offsets using helper script
>>  gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
>>  quiet_cmd_vdsosym = VDSOSYM $@
>> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
>> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
>>  
>>  include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
>>  	$(call if_changed,vdsosym)
>> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
>> index 572475b7b7ed..4f8fe34bc75a 100644
>> --- a/arch/arm64/kernel/vdso32/Makefile
>> +++ b/arch/arm64/kernel/vdso32/Makefile
>> @@ -205,7 +205,7 @@ quiet_cmd_vdsomunge = MUNGE   $@
>>  gen-vdsosym := $(srctree)/$(src)/../vdso/gen_vdso_offsets.sh
>>  quiet_cmd_vdsosym = VDSOSYM $@
>>  # The AArch64 nm should be able to read an AArch32 binary
>> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
>> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
>>  
>>  # Install commands for the unstripped file
>>  quiet_cmd_vdso_install = INSTALL32 $@
>> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
>> index 2876a7df1b0a..3e97ad2235d2 100644
>> --- a/arch/ia64/Makefile
>> +++ b/arch/ia64/Makefile
>> @@ -28,8 +28,8 @@ cflags-y	:= -pipe $(EXTRA) -ffixed-r13 -mfixed-range=f12-f15,f32-f127 \
>>  		   -falign-functions=32 -frename-registers -fno-optimize-sibling-calls
>>  KBUILD_CFLAGS_KERNEL := -mconstant-gp
>>  
>> -GAS_STATUS	= $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>> +GAS_STATUS	= $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>> +KBUILD_CPPFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>>
> 
> That is duplicate. Drop shell.
>   
>>  ifeq ($(GAS_STATUS),buggy)
>>  $(error Sorry, you need a newer version of the assember, one that is built from	\
>> diff --git a/arch/nds32/kernel/vdso/Makefile b/arch/nds32/kernel/vdso/Makefile
>> index 55df25ef0057..e77d4bcfa7c1 100644
>> --- a/arch/nds32/kernel/vdso/Makefile
>> +++ b/arch/nds32/kernel/vdso/Makefile
>> @@ -39,7 +39,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>>  # Generate VDSO offsets using helper script
>>  gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
>>  quiet_cmd_vdsosym = VDSOSYM $@
>> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
>> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
>>
> 
> I guess it is better to modify gen-vdsosym.

Do you mean something as follows:
gen-vdsosym := $(CONFIG_SHELL) $(srctree)/$(src)/gen_vdso_offsets.sh

If so, I have never seen that style in the build files. Infact, the current
style is followed at many places.
For instance,
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/scripts/Makefile.lib?h=next-20201001#n398
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/tools/Makefile?h=next-20201001#n50

> 
>   
>>  include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
>>  	$(call if_changed,vdsosym)
>> diff --git a/drivers/staging/comedi/drivers/ni_routing/tools/Makefile b/drivers/staging/comedi/drivers/ni_routing/tools/Makefile
>> index 6e92a06a44cb..1d4635320fdb 100644
>> --- a/drivers/staging/comedi/drivers/ni_routing/tools/Makefile
>> +++ b/drivers/staging/comedi/drivers/ni_routing/tools/Makefile
>> @@ -42,14 +42,14 @@ ni_values.py: convert_c_to_py
>>  	./convert_c_to_py
>>  
>>  csv-files : ni_values.py comedi_h.py
>> -	./convert_py_to_csv.py
>> +	$(PYTHON3) ./convert_py_to_csv.py
>>  
>>  csv-blank :
>> -	./make_blank_csv.py
>> +	$(PYTHON3) ./make_blank_csv.py
>>  	@echo New blank csv signal table in csv/blank_route_table.csv
>>  
>>  c-files : comedi_h.py
>> -	./convert_csv_to_c.py --route_values --device_routes
>> +	$(PYTHON3) ./convert_csv_to_c.py --route_values --device_routes
>>  
>>  ROUTE_VALUES_SRC=$(wildcard ../ni_route_values/*.c)
>>  DEVICE_ROUTES_SRC=$(wildcard ../ni_device_routes/*.c)
>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>> index a467b9323442..893217ee4a17 100644
>> --- a/scripts/Makefile.build
>> +++ b/scripts/Makefile.build
>> @@ -104,7 +104,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
>>  endif
>>  
>>  ifneq ($(KBUILD_EXTRA_WARN),)
>> -  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $<
>> +  cmd_checkdoc = $(PERL) $(srctree)/scripts/kernel-doc -none $<
>>  endif
>>  
>>  # Compile C sources (.c)
>> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
>> index f952fb64789d..4fc16c4776cc 100644
>> --- a/scripts/Makefile.package
>> +++ b/scripts/Makefile.package
>> @@ -44,7 +44,7 @@ if test "$(objtree)" != "$(srctree)"; then \
>>  	echo >&2; \
>>  	false; \
>>  fi ; \
>> -$(srctree)/scripts/setlocalversion --save-scmversion; \
>> +$(CONFIG_SHELL) $(srctree)/scripts/setlocalversion --save-scmversion; \
>>  tar -I $(KGZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
>>  	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
>>  rm -f $(objtree)/.scmversion
>> @@ -123,7 +123,7 @@ git --git-dir=$(srctree)/.git archive --prefix=$(perf-tar)/         \
>>  mkdir -p $(perf-tar);                                               \
>>  git --git-dir=$(srctree)/.git rev-parse HEAD > $(perf-tar)/HEAD;    \
>>  (cd $(srctree)/tools/perf;                                          \
>> -util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
>> +$(CONFIG_SHELL) util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
>>  tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
>>  rm -r $(perf-tar);                                                  \
>>  $(if $(findstring tar-src,$@),,                                     \
>> diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
>> index da5975775337..b6aee03a6ca9 100644
>> --- a/tools/bootconfig/Makefile
>> +++ b/tools/bootconfig/Makefile
>> @@ -21,7 +21,7 @@ $(OUTPUT)bootconfig: main.c $(LIBSRC)
>>  	$(CC) $(filter %.c,$^) $(CFLAGS) -o $@
>>  
>>  test: $(ALL_PROGRAMS) test-bootconfig.sh
>> -	./test-bootconfig.sh $(OUTPUT)
>> +	$(CONFIG_SHELL) ./test-bootconfig.sh $(OUTPUT)
>>  
>>  install: $(ALL_PROGRAMS)
>>  	install $(OUTPUT)bootconfig $(DESTDIR)$(bindir)
>> diff --git a/tools/bpf/Makefile.helpers b/tools/bpf/Makefile.helpers
>> index 854d084026dd..6f2b042ff719 100644
>> --- a/tools/bpf/Makefile.helpers
>> +++ b/tools/bpf/Makefile.helpers
>> @@ -35,7 +35,7 @@ man7: $(DOC_MAN7)
>>  RST2MAN_DEP := $(shell command -v rst2man 2>/dev/null)
>>  
>>  $(OUTPUT)$(HELPERS_RST): $(UP2DIR)../../include/uapi/linux/bpf.h
>> -	$(QUIET_GEN)$(UP2DIR)../../scripts/bpf_helpers_doc.py --filename $< > $@
>> +	$(QUIET_GEN)$(PYTHON3) $(UP2DIR)../../scripts/bpf_helpers_doc.py --filename $< > $@
>>  
>>  $(OUTPUT)%.7: $(OUTPUT)%.rst
>>  ifndef RST2MAN_DEP
>> diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
>> index f43249696d9f..8a3f7399568f 100644
>> --- a/tools/lib/bpf/Makefile
>> +++ b/tools/lib/bpf/Makefile
>> @@ -179,7 +179,7 @@ $(BPF_IN_STATIC): force elfdep zdep bpfdep $(BPF_HELPER_DEFS)
>>  	$(Q)$(MAKE) $(build)=libbpf OUTPUT=$(STATIC_OBJDIR)
>>  
>>  $(BPF_HELPER_DEFS): $(srctree)/tools/include/uapi/linux/bpf.h
>> -	$(QUIET_GEN)$(srctree)/scripts/bpf_helpers_doc.py --header \
>> +	$(QUIET_GEN)$(PYTHON3) $(srctree)/scripts/bpf_helpers_doc.py --header \
>>  		--file $(srctree)/tools/include/uapi/linux/bpf.h > $(BPF_HELPER_DEFS)
>>  
>>  $(OUTPUT)libbpf.so: $(OUTPUT)libbpf.so.$(LIBBPF_VERSION)
>> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
>> index 6031167939ae..42f797e541d0 100644
>> --- a/tools/perf/Makefile.perf
>> +++ b/tools/perf/Makefile.perf
>> @@ -229,7 +229,7 @@ goals := $(filter-out all sub-make, $(MAKECMDGOALS))
>>  $(goals) all: sub-make
>>  
>>  sub-make: fixdep
>> -	@./check-headers.sh
>> +	$(Q)$(SHELL) ./check-headers.sh
>>  	$(Q)$(MAKE) FIXDEP=1 -f Makefile.perf $(goals)
>>  
>>  else # force_fixdep
>> diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefile
>> index c7bcddbd486d..b683e774f5e3 100644
>> --- a/tools/power/cpupower/Makefile
>> +++ b/tools/power/cpupower/Makefile
>> @@ -51,7 +51,7 @@ DESTDIR ?=
>>  # Package-related definitions. Distributions can modify the version
>>  # and _should_ modify the PACKAGE_BUGREPORT definition
>>  
>> -VERSION:=			$(shell ./utils/version-gen.sh)
>> +VERSION:=			$(shell $(CONFIG_SHELL) ./utils/version-gen.sh)
> 
> Duplicate shell.
> 
>>  LIB_MAJ=			0.0.1
>>  LIB_MIN=			0
>>  
>> diff --git a/tools/testing/selftests/rcutorture/Makefile b/tools/testing/selftests/rcutorture/Makefile
>> index 5202dc666206..011a6990e8ac 100644
>> --- a/tools/testing/selftests/rcutorture/Makefile
>> +++ b/tools/testing/selftests/rcutorture/Makefile
>> @@ -1,3 +1,3 @@
>>  # SPDX-License-Identifier: GPL-2.0+
>>  all:
>> -	( cd ../../../..; tools/testing/selftests/rcutorture/bin/kvm.sh --duration 10 --configs TREE01 )
>> +	( cd ../../../..; $(CONFIG_SHELL) tools/testing/selftests/rcutorture/bin/kvm.sh --duration 10 --configs TREE01 )
>> diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
>> index 2af9d39a9716..6b0ae924cc7e 100644
>> --- a/tools/testing/selftests/rseq/Makefile
>> +++ b/tools/testing/selftests/rseq/Makefile
>> @@ -17,7 +17,7 @@ TEST_GEN_PROGS = basic_test basic_percpu_ops_test param_test \
>>  
>>  TEST_GEN_PROGS_EXTENDED = librseq.so
>>  
>> -TEST_PROGS = run_param_test.sh
>> +TEST_PROGS = $(CONFIG_SHELL) run_param_test.sh
>>  
>>  TEST_FILES := settings
>>  
>> diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
>> index 30873b19d04b..a67a19a36cde 100644
>> --- a/tools/testing/selftests/vm/Makefile
>> +++ b/tools/testing/selftests/vm/Makefile
>> @@ -40,9 +40,9 @@ TEST_GEN_FILES += userfaultfd
>>  TEST_GEN_FILES += khugepaged
>>  
>>  ifeq ($(ARCH),x86_64)
>> -CAN_BUILD_I386 := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_32bit_program.c -m32)
>> -CAN_BUILD_X86_64 := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_64bit_program.c)
>> -CAN_BUILD_WITH_NOPIE := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_program.c -no-pie)
>> +CAN_BUILD_I386 := $(shell $(CONFIG_SHELL) ./../x86/check_cc.sh $(CC) ../x86/trivial_32bit_program.c -m32)
>> +CAN_BUILD_X86_64 := $(shell $(CONFIG_SHELL) ./../x86/check_cc.sh $(CC) ../x86/trivial_64bit_program.c)
>> +CAN_BUILD_WITH_NOPIE := $(shell $(CONFIG_SHELL) ./../x86/check_cc.sh $(CC) ../x86/trivial_program.c -no-pie)
>>  
>>  TARGETS := protection_keys
>>  BINARIES_32 := $(TARGETS:%=%_32)
>> diff --git a/tools/testing/selftests/wireguard/qemu/Makefile b/tools/testing/selftests/wireguard/qemu/Makefile
>> index 4bdd6c1a19d3..d24f3efb2633 100644
>> --- a/tools/testing/selftests/wireguard/qemu/Makefile
>> +++ b/tools/testing/selftests/wireguard/qemu/Makefile
>> @@ -255,8 +255,8 @@ $(KERNEL_BUILD_PATH)/.config: kernel.config arch/$(ARCH).config
>>  	printf 'CONFIG_NR_CPUS=$(NR_CPUS)\nCONFIG_INITRAMFS_SOURCE="$(BUILD_PATH)/init-cpio-spec.txt"\n' >> $(KERNEL_BUILD_PATH)/minimal.config
>>  	cat arch/$(ARCH).config >> $(KERNEL_BUILD_PATH)/minimal.config
>>  	$(MAKE) -C $(KERNEL_PATH) O=$(KERNEL_BUILD_PATH) ARCH=$(KERNEL_ARCH) allnoconfig
>> -	cd $(KERNEL_BUILD_PATH) && ARCH=$(KERNEL_ARCH) $(KERNEL_PATH)/scripts/kconfig/merge_config.sh -n $(KERNEL_BUILD_PATH)/.config $(KERNEL_BUILD_PATH)/minimal.config
>> -	$(if $(findstring yes,$(DEBUG_KERNEL)),cp debug.config $(KERNEL_BUILD_PATH) && cd $(KERNEL_BUILD_PATH) && ARCH=$(KERNEL_ARCH) $(KERNEL_PATH)/scripts/kconfig/merge_config.sh -n $(KERNEL_BUILD_PATH)/.config debug.config,)
>> +	cd $(KERNEL_BUILD_PATH) && ARCH=$(KERNEL_ARCH) $(CONFIG_SHELL) $(KERNEL_PATH)/scripts/kconfig/merge_config.sh -n $(KERNEL_BUILD_PATH)/.config $(KERNEL_BUILD_PATH)/minimal.config
>> +	$(if $(findstring yes,$(DEBUG_KERNEL)),cp debug.config $(KERNEL_BUILD_PATH) && cd $(KERNEL_BUILD_PATH) && ARCH=$(KERNEL_ARCH) $(CONFIG_SHELL) $(KERNEL_PATH)/scripts/kconfig/merge_config.sh -n $(KERNEL_BUILD_PATH)/.config debug.config,)
>>  
>>  $(KERNEL_BZIMAGE): $(KERNEL_BUILD_PATH)/.config $(BUILD_PATH)/init-cpio-spec.txt $(MUSL_PATH)/lib/libc.so $(IPERF_PATH)/src/iperf3 $(IPUTILS_PATH)/ping $(BASH_PATH)/bash $(IPROUTE2_PATH)/misc/ss $(IPROUTE2_PATH)/ip/ip $(IPTABLES_PATH)/iptables/xtables-legacy-multi $(NMAP_PATH)/ncat/ncat $(WIREGUARD_TOOLS_PATH)/src/wg $(BUILD_PATH)/init ../netns.sh $(WIREGUARD_SOURCES)
>>  	$(MAKE) -C $(KERNEL_PATH) O=$(KERNEL_BUILD_PATH) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(CROSS_COMPILE)
>> diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
>> index 6703c7906b71..eb2c1025def0 100644
>> --- a/tools/testing/selftests/x86/Makefile
>> +++ b/tools/testing/selftests/x86/Makefile
>> @@ -6,9 +6,9 @@ include ../lib.mk
>>  .PHONY: all all_32 all_64 warn_32bit_failure clean
>>  
>>  UNAME_M := $(shell uname -m)
>> -CAN_BUILD_I386 := $(shell ./check_cc.sh $(CC) trivial_32bit_program.c -m32)
>> -CAN_BUILD_X86_64 := $(shell ./check_cc.sh $(CC) trivial_64bit_program.c)
>> -CAN_BUILD_WITH_NOPIE := $(shell ./check_cc.sh $(CC) trivial_program.c -no-pie)
>> +CAN_BUILD_I386 := $(shell $(SHELL) ./check_cc.sh $(CC) trivial_32bit_program.c -m32)
>> +CAN_BUILD_X86_64 := $(shell $(SHELL) ./check_cc.sh $(CC) trivial_64bit_program.c)
>> +CAN_BUILD_WITH_NOPIE := $(shell $(SHELL) ./check_cc.sh $(CC) trivial_program.c -no-pie)
>>  
>>  TARGETS_C_BOTHBITS := single_step_syscall sysret_ss_attrs syscall_nt test_mremap_vdso \
>>  			check_initial_reg_state sigreturn iopl ioperm \
>> -- 
>> 2.26.2
>>
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
