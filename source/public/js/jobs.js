function jobsComponent () {
    return {
        openCount: 0,
        hideExpired () {
            const now = new Date();
            this.$refs.job.parentElement.querySelectorAll('[data-expires]').forEach(el => {
                const expires = new Date(el.dataset.expires);
                if (expires > now){
                    this.openCount++;
                } else {
                    el.remove();
                }
            });
        }
    }
}